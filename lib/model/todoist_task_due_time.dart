import 'package:freezed_annotation/freezed_annotation.dart';

part 'todoist_task_due_time.freezed.dart';
part 'todoist_task_due_time.g.dart';

// ignore_for_file: invalid_annotation_target

@freezed
class TodoistTaskDueTime with _$TodoistTaskDueTime {
  const factory TodoistTaskDueTime({
    @JsonKey(name: 'date') required String dateStr,
    @JsonKey(name: 'datetime') String? datetimeStr,
    required bool recurring,
    required String string,
    String? lang,
  }) = _TodoistTaskDueTime;

  factory TodoistTaskDueTime.fromJson(Map<String, Object?> json) =>
      _$TodoistTaskDueTimeFromJson(json);
}
