// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      todoistTask: json['todoistTask'] == null
          ? null
          : TodoistTask.fromJson(json['todoistTask'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'todoistTask': instance.todoistTask,
    };
