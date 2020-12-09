import 'dart:convert';
import 'package:dio/dio.dart';
import 'base_model.dart';
import 'package:xml2json/xml2json.dart';

enum RequestMode {
  get,
  post
}

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
    if (_instance == null){
      _instance = Network._internal();
    }
    return _instance;
  }

  get(String url, Map<String,dynamic> params, {Function success, Function failure}){
    _doRequest(url, params, RequestMode.get, success, failure);
  }

  post(String url, Map<String,dynamic> params, {Function success, Function failure}){
    _doRequest(url, params, RequestMode.post, success, failure);
  }

  void _doRequest(String url, Map<String,dynamic> params, RequestMode method, Function successCallBack, Function failureCallBack) async{
    try{
      /// 可以添加header
      //  dio.options.headers.addAll({'token':xxx});
      Response response;
      switch (method){
        case RequestMode.get:
          if (params != null && params.isNotEmpty){
            response = await dio.get(url,queryParameters: params);
          } else {
            response = await dio.get(url);
          }
          break;
        case RequestMode.post:
          if (params != null && params.isNotEmpty){
            response = await dio.post(url,queryParameters: params);
          } else {
            response = await dio.post(url);
          }
          break;
      }
      Map<String, dynamic> result = json.decode(response.toString());
      // 打印信息
      print('''api: $url\nparams: $params\nresult: $result''');
      // 转化为model
      BaseModel model = BaseModel.fromJson(result);
      if (model.code == 200){ // 200 请求成功
        if (successCallBack != null){// 返回请求数据
          successCallBack(model.data);
        }
      }else {
        //直接使用Toast弹出错误信息
        //返回失败信息
        if (failureCallBack != null){
          failureCallBack(model.error);
        }
      }
    }catch (exception){
      print('错误：${exception.toString()}');
      if (failureCallBack != null){
        failureCallBack(exception.toString());
      }
    }
  }

}