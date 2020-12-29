import 'package:flutter_app/base/base_model.dart';
import 'package:flutter_app/network/basic_model.dart';

class TestModel extends BaseModel {
  requestData(Function success, Function failure) {
    var params = {"memberID": "0006893471"};
    post("GiftConfigBrowseNew", params, DataType.json, (data) {

    }, (error) {

    });
  }
}