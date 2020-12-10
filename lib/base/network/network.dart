import 'dart:convert';
import 'package:dio/dio.dart';
import 'base_model.dart';
import 'package:encrypt/encrypt.dart';
import 'package:xml2json/xml2json.dart';

String staticKey = 'ABCDEFGHIJK12345';

class Network {
  // 工厂模式
  factory Network() => _getInstance();
  static Network get instance => _getInstance();
  static Network _instance;

  Dio dio;
  Network._internal() {
    // 初始化
    dio = Dio(BaseOptions(
      connectTimeout: 60000,   // 连接服务器超时时间，单位是毫秒.
      receiveTimeout: 10000,   // 响应流上前后两次接受到数据的间隔，单位为毫秒, 这并不是接收数据的总时限.
    )
    );
  }
  // 单列模式
  static Network _getInstance() {
    if (_instance == null) {
      _instance = Network._internal();
    }
    return _instance;
  }

  post(String url, String port, String key, Map<String,dynamic> params, {Function success, Function failure}){
    _doRequest(url, port, key, params, success, failure);
  }

  void _doRequest(String url, String port, String key, Map<String,dynamic> params, Function successCallBack, Function failureCallBack) async{
    try {
      print(_encryptData(params, key));
      Response response;
      if (params != null && params.isNotEmpty){
        response = await dio.post(url, data: params);
      } else {
        response = await dio.post(url);
      }
      Map<String, dynamic> result = json.decode(response.toString());
      // 打印信息
      print('''api: $url\nparams: $params\nresult: $result''');
      // 转化为model
      BaseModel model = BaseModel.fromJson(result);
      if (model.result.isSuccess){ // 200 请求成功
        if (successCallBack != null){// 返回请求数据
          successCallBack(model.data);
        }
      } else {
        //直接使用Toast弹出错误信息
        //返回失败信息
        if (failureCallBack != null){
          failureCallBack(model.result.returnText);
        }
      }
    }catch (exception){
      print('错误：${exception.toString()}');
      if (failureCallBack != null){
        failureCallBack(exception.toString());
      }
    }
  }

  _encryptData(Map<String, dynamic> params, String encryptKey) {
    final plainText = json.encode(params);
    final key = Key.fromUtf8(encryptKey);
    final iv = IV.fromLength(0);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    return encrypted.base64;
  }

  _dencrypt() {
    final plainText = json.encode(params);
    final key = Key.fromUtf8(encryptKey);
    final iv = IV.fromLength(0);

    final encrypter = Encrypter(AES(key));

    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }

}