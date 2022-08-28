import 'package:intl/intl.dart';
import 'package:todocalendarist/base/general_error.dart';
import 'package:todocalendarist/base/pair.dart';
import 'package:todocalendarist/base/result.dart';
import 'package:todocalendarist/model/dates/todoist_recurring_dates_parsing.dart';
import 'package:todocalendarist/model/task.dart';
import 'package:todocalendarist/model/todoist_task.dart';
import 'package:todocalendarist/model/todoist_task_due_time.dart';
import 'package:todocalendarist/tasks/fetched_tasks.dart';
import 'package:todocalendarist/todoist/todoist.dart';
import 'package:todocalendarist/utils/time_provider.dart';

class TasksManager {
  final Todoist _todoist;
  final TimeProvider _timeProvider;
  final Duration recurringDatesDuration;
  List<Task>? _tasks;

  TasksManager(this._todoist, this._timeProvider,
      {this.recurringDatesDuration = todoistRecurringDatesDefaultDuration});

  List<Task>? getFetchedTasks() => _tasks;

  Future<Result<FetchedTasks, GeneralError>> fetchTasks() async {
    final todoistTasksRes = await _todoist.fetchTasks();
    if (todoistTasksRes.isErr) {
      return Err(todoistTasksRes.unwrapErr());
    }

    final todoistTasks = todoistTasksRes.unwrap();
    final recurringDatesParsingErrors =
        <Pair<TodoistTask, RecurringDatesParsingError>>[];

    for (final task in todoistTasks.toList()) {
      // defensive copy
      final due = task.due;
      if (due != null && due.recurring == true) {
        final parseRes = parseRecurringTimeString(
          due.string,
          nextDateTime: (due.nextDatetime ?? due.nextDate),
          now: _timeProvider.now(),
          defaultDuration: todoistRecurringDatesDefaultDuration,
        );
        if (parseRes.isOk) {
          final nextDates = parseRes.unwrap();
          for (final nextDate in nextDates) {
            // "date": "2022-07-31",
            // "datetime": "2022-07-31T10:30:00",
            final nextDueDateStr = _dateFormat.format(nextDate);
            final nextDueDatetimeStr = due.nextDatetime != null
                ? _datetimeFormat.format(nextDate)
                : null;
            todoistTasks.add(task.copyWith(
                due: due.copyWith(
              dateStr: nextDueDateStr,
              datetimeStr: nextDueDatetimeStr,
            )));
          }
        } else {
          recurringDatesParsingErrors.add(Pair(task, parseRes.unwrapErr()));
        }
      }
    }

    return Ok(FetchedTasks(
      tasks: todoistTasks.map((e) => Task.fromTodoistTak(e)).toList(),
      recurringDatesParsingErrors: recurringDatesParsingErrors,
    ));
  }
}

final _dateFormat = DateFormat('yyyy-MM-dd');
final _datetimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
