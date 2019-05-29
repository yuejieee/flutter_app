import 'dart:convert';

class DayInHisotryModel {
  String today;
  List<DayInHisotryItem> result;

  DayInHisotryModel.fromJson(Map<String, dynamic> json)
}

class DayInHisotryItem {
  String year;
  String title;
}