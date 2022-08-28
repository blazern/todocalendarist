import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todocalendarist/base/pair.dart';
import 'package:todocalendarist/model/dates/todoist_recurring_dates_parsing.dart';
import 'package:todocalendarist/model/task.dart';
import 'package:todocalendarist/model/todoist_task.dart';

part 'fetched_tasks.freezed.dart';

// ignore_for_file: invalid_annotation_target

@freezed
class FetchedTasks with _$FetchedTasks {
  const factory FetchedTasks({
    required List<Task> tasks,
    required List<Pair<TodoistTask, RecurringDatesParsingError>>
        recurringDatesParsingErrors,
  }) = _FetchedTasks;
}
