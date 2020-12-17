import 'dart:convert';
import 'package:dio/dio.dart';
import 'base_model.dart';
import 'network_config.dart';
import 'package:encrypt/encrypt.dart';
import 'package:xml2json/xml2json.dart';

enum DataType {
  xml,
  json,
}

class Network {
  // 工厂模式
  factory Network() => _getInstance();

  static Network get instance => _getInstance();
  static Network _instance;

  NetworkConfig config;
  Dio dio;

  Network._internal() {
    // 初始化
    dio = Dio(BaseOptions(
      connectTimeout: 60000, // 连接服务器超时时间，单位是毫秒.
      receiveTimeout: 10000, // 响应流上前后两次接受到数据的间隔，单位为毫秒, 这并不是接收数据的总时限.
    ));
  }

  // 单列模式
  static Network _getInstance() {
    if (_instance == null) {
      _instance = Network._internal();
    }
    return _instance;
  }

  post(String domain, String port, Map<String, dynamic> params, DataType type,
      Function success, Function failure) {
    String checkCode = _getCheckCode('0000');
    String realDomain = domain.length > 0 ? domain : config?.domain;
    String completeUrl =
        "$realDomain/KCPort/PortCall?Unid=${'123'}&Port=$port&CheckCode=$checkCode";
    print("url is $completeUrl");
    _doRequest(completeUrl, port, params, type, success, failure);
  }

  void _doRequest(String url, String port, Map<String, dynamic> params,
      DataType type,
      Function successCallBack, Function failureCallBack) async {
    String key = config.dynamicKey != null ? config.dynamicKey : config
        .staticKey;
    try {
      Response response;
      if (params != null && params.isNotEmpty) {
        if (config != null) {
          String dataText;
          if (type == DataType.xml) {
            dataText = _handleXMLOnPackData(params, port);
          } else {
            dataText = json.encode(params);
          }
          print("dataText is $dataText");
          dynamic data = _encryptData(dataText, key);
          print("data is $data");
          response = await dio.post(url, data: data);
        }
      } else {
        response = await dio.post(url);
      }
      // 打印信息
      String data = _decrypt(response.toString(), key);
      Map<String, dynamic> result;
      if (type == DataType.xml) {
        String jsonStr = _handleXMLToPackData(data);
        result = json.decode(jsonStr);
      } else {
        result = json.decode(response.toString());
      }
      print(result);

    } catch (error) {
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        print("请求超时");
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        print("服务器错误");
      }

      print('请求异常: ' + error.toString());
      print('请求异常url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      print('method: ' + dio.options.method);

      if (failureCallBack != null) {
        failureCallBack(error.toString());
      }
    }
  }

  _getCheckCode(String memberId) {
    return "$memberId;${config.appVersion};iOS;${config.appType};0";
  }

  // XML上行处理
  _handleXMLOnPackData(Map<String, dynamic> params, String port) {
    String rootElement = port + "OnPack";
    var xml = "<?xml version=\"1.0\" encoding=\"utf-8\" ?><$rootElement>";
    params.forEach((key, value) {
      xml = xml + "<$key>$value</$key>";
    });
    xml = xml + "</$rootElement>";
    return xml;
  }

  // XML下行处理
  _handleXMLToPackData(String data) {
    try {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(data);
      return xml2json.toParker();
    } catch (error) {
      return data;
    }
  }

  // 加密
  _encryptData(String paramStr, String encryptKey) {
    try {
      final key = Key.fromUtf8(encryptKey);
      final iv = IV.fromLength(0);

      final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
      final encrypted = encrypter.encrypt(paramStr, iv: iv);
      return encrypted.base64;
    } catch (error) {
      print("加密失败" + error.toString());
      return null;
    }
  }

  // 解密
  _decrypt(String data, String encryptKey) {
    try {
      final key = Key.fromUtf8(encryptKey);
      final iv = IV.fromLength(0);

      final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
      final decrypted = encrypter.decrypt64(data, iv: iv);
      return decrypted;
    } catch (error) {
      print("解密失败" + error.toString());
      return data;
    }
  }
}
