import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/base/result.dart';
import 'package:todocalendarist/model/task.dart';
import 'package:todocalendarist/model/todoist_task.dart';
import 'package:todocalendarist/model/todoist_task_due_time.dart';
import 'package:todocalendarist/tasks/tasks_manager.dart';

import '../fakes/fake_time_provider.dart';
import '../fakes/fake_todoist.dart';

void main() {
  late FakeTodoist todoist;
  late FakeTimeProvider timeProvider;
  late TasksManager tasksManager;

  setUp(() async {
    todoist = FakeTodoist();
    timeProvider = FakeTimeProvider();
    tasksManager = TasksManager(todoist, timeProvider);
  });

  test('just fetch tasks', () async {
    final todoistTasks = [
      const TodoistTask(
        id: 6031974229,
        projectId: 2286844284,
        content: 'Read https://germanwithlaura.com/declension/',
        url: 'https://todoist.com/showTask?id=6031974229',
        completed: false,
        due: TodoistTaskDueTime(
          dateStr: '2022-07-31',
          recurring: false,
          string: '2022-07-31',
        ),
      ),
      const TodoistTask(
        id: 6031974230,
        projectId: 2286844284,
        content: 'Read! https://germanwithlaura.com/declension/',
        url: 'https://todoist.com/showTask?id=6031974230',
        completed: false,
        due: TodoistTaskDueTime(
          dateStr: '2022-07-30',
          recurring: false,
          string: '2022-07-30',
        ),
      ),
    ];

    todoist.setFetchedTasks(Ok(todoistTasks));
    final fetchedTasks = (await tasksManager.fetchTasks()).unwrap();
    expect(fetchedTasks.tasks,
        equals(todoistTasks.map((e) => Task.fromTodoistTak(e)).toList()));
  });

  test('fetch recurring tasks', () async {
    timeProvider.setNow(DateTime.parse('2022-07-01T10:30:00'));

    final todoistTasks = [
      const TodoistTask(
        id: 6031974229,
        projectId: 2286844284,
        content: 'Read https://germanwithlaura.com/declension/',
        url: 'https://todoist.com/showTask?id=6031974229',
        completed: false,
        due: TodoistTaskDueTime(
          dateStr: '2022-07-30',
          recurring: true,
          string: 'every month on 30th', // <=========================
          datetimeStr: '2022-07-30T10:30:00',
        ),
      ),
      const TodoistTask(
        id: 6031974230,
        projectId: 2286844284,
        content: 'Read! https://germanwithlaura.com/declension/',
        url: 'https://todoist.com/showTask?id=6031974230',
        completed: false,
        due: TodoistTaskDueTime(
          dateStr: '2022-07-31',
          recurring: false,
          string: '2022-07-31',
          datetimeStr: '2022-07-31T10:30:00',
        ),
      ),
    ];

    todoist.setFetchedTasks(Ok(todoistTasks));

    final expectedTasks = {
      ...todoistTasks.map((e) => Task.fromTodoistTak(e)),
      Task.fromTodoistTak(todoistTasks.first.copyWith(
          due: todoistTasks.first.due!.copyWith(
        dateStr: '2022-08-30',
        datetimeStr: '2022-08-30T10:30:00',
      ))),
    };

    final fetchedTasks = (await tasksManager.fetchTasks()).unwrap();
    expect(fetchedTasks.tasks.toSet(), equals(expectedTasks));
  });
}
