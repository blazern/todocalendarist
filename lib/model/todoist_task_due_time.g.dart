// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoist_task_due_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoistTaskDueTime _$$_TodoistTaskDueTimeFromJson(
        Map<String, dynamic> json) =>
    _$_TodoistTaskDueTime(
      dateStr: json['date'] as String,
      datetimeStr: json['datetime'] as String?,
      recurring: json['recurring'] as bool,
      string: json['string'] as String,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$$_TodoistTaskDueTimeToJson(
        _$_TodoistTaskDueTime instance) =>
    <String, dynamic>{
      'date': instance.dateStr,
      'datetime': instance.datetimeStr,
      'recurring': instance.recurring,
      'string': instance.string,
      'lang': instance.lang,
    };
