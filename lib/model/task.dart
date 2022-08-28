import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todocalendarist/model/todoist_task.dart';

part 'task.freezed.dart';
part 'task.g.dart';

// ignore_for_file: invalid_annotation_target

@freezed
class Task with _$Task {
  const factory Task({
    required TodoistTask? todoistTask,
  }) = _Task;

  static Task fromTodoistTak(TodoistTask todoistTask) =>
      Task(todoistTask: todoistTask);

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}

extension TaskExt on Task {
  DateTime? get nextDate => todoistTask?.nextDate;
  DateTime? get nextDatetime => todoistTask?.nextDatetime;
  String get content => (todoistTask?.content)!;
}
