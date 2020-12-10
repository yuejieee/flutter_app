class Result {
  bool isSuccess;
  String secondaryFlag;
  String returnText;
  String returnFlag;

  Result({this.isSuccess, this.secondaryFlag, this.returnFlag, this.returnText});

}

class BaseModel {
  Result result;
  dynamic data;

  BaseModel({this.result, this.data});

  BaseModel.fromJson(Map<String, dynamic> json) {

  }
}