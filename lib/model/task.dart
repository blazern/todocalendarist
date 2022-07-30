import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

// ignore_for_file: invalid_annotation_target

@freezed
class Task with _$Task {
  const factory Task({
    required int id,
    @JsonKey(name: 'project_id') required int projectId,
    required String content,
    required String url,
    required bool completed,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json)
  => _$TaskFromJson(json);
}
