import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todocalendarist/model/todoist_task_due_time.dart';

part 'todoist_task.freezed.dart';
part 'todoist_task.g.dart';

// ignore_for_file: invalid_annotation_target

@freezed
class TodoistTask with _$TodoistTask {
  const factory TodoistTask({
    required int id,
    @JsonKey(name: 'project_id') required int projectId,
    required String content,
    required String url,
    required bool completed,
    @JsonKey(name: 'due') TodoistTaskDueTime? due,
  }) = _TodoistTask;

  factory TodoistTask.fromJson(Map<String, Object?> json) =>
      _$TodoistTaskFromJson(json);
}

extension TodoistTaskExt on TodoistTask {
  DateTime? get nextDate => due?.nextDate;
  DateTime? get nextDatetime => due?.nextDatetime;
}
