import 'package:json_annotation/json_annotation.dart';

part 'day_in_history_model.g.dart';


@JsonSerializable()
class DayInHistoryModel extends Object {

  @JsonKey(name: 'today')
  String today;

  @JsonKey(name: 'result')
  List<DayInHistoryItem> result;

  DayInHistoryModel(this.today,this.result,);

  factory DayInHistoryModel.fromJson(Map<String, dynamic> srcJson) => _$DayInHistoryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DayInHistoryModelToJson(this);

}


@JsonSerializable()
class DayInHistoryItem extends Object {

  @JsonKey(name: 'year')
  String year;

  @JsonKey(name: 'title')
  String title;

  DayInHistoryItem(this.year,this.title,);

  factory DayInHistoryItem.fromJson(Map<String, dynamic> srcJson) => _$DayInHistoryItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DayInHistoryItemToJson(this);


}


