// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_in_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayInHistoryModel _$DayInHistoryModelFromJson(Map<String, dynamic> json) {
  return DayInHistoryModel(
      json['today'] as String,
      (json['result'] as List)
          ?.map((e) => e == null
              ? null
              : DayInHistoryItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DayInHistoryModelToJson(DayInHistoryModel instance) =>
    <String, dynamic>{'today': instance.today, 'result': instance.result};

DayInHistoryItem _$DayInHistoryItemFromJson(Map<String, dynamic> json) {
  return DayInHistoryItem(json['year'] as String, json['title'] as String);
}

Map<String, dynamic> _$DayInHistoryItemToJson(DayInHistoryItem instance) =>
    <String, dynamic>{'year': instance.year, 'title': instance.title};
