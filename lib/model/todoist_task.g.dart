// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoist_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoistTask _$$_TodoistTaskFromJson(Map<String, dynamic> json) =>
    _$_TodoistTask(
      id: json['id'] as int,
      projectId: json['project_id'] as int,
      content: json['content'] as String,
      url: json['url'] as String,
      completed: json['completed'] as bool,
      due: json['due'] == null
          ? null
          : TodoistTaskDueTime.fromJson(json['due'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TodoistTaskToJson(_$_TodoistTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'content': instance.content,
      'url': instance.url,
      'completed': instance.completed,
      'due': instance.due,
    };
