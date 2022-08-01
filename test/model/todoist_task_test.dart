import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/model/todoist_task.dart';
import 'package:todocalendarist/model/todoist_task_due_time.dart';

void main() {
  test('json parsing', () {
    const json = '''
    {
      "id": 6031974229,
      "assigner": 0,
      "project_id": 2286844284,
      "section_id": 0,
      "order": 8,
      "content": "Read https://germanwithlaura.com/declension/",
      "description": "",
      "completed": false,
      "label_ids": [
        2150816663,
        2150823189,
        2150816121
      ],
      "priority": 1,
      "comment_count": 0,
      "creator": 18443214,
      "created": "2022-07-25T05:46:17.916374Z",
      "url": "https://todoist.com/showTask?id=6031974229",
      "due": {
        "date": "2022-07-31",
        "string": "каждый день в 10:30",
        "lang": "ru",
        "datetime": "2022-07-31T10:30:00",
        "recurring": true
      }
    }
    ''';

    final decodedTask = TodoistTask.fromJson(jsonDecode(json));
    const expectedTask = TodoistTask(
      id: 6031974229,
      projectId: 2286844284,
      content: 'Read https://germanwithlaura.com/declension/',
      url: 'https://todoist.com/showTask?id=6031974229',
      completed: false,
      due: TodoistTaskDueTime(
        dateStr: '2022-07-31',
        datetimeStr: '2022-07-31T10:30:00',
        recurring: true,
        lang: 'ru',
        string: 'каждый день в 10:30',
      ),
    );

    expect(decodedTask, equals(expectedTask));
  });

  test('date property', () {
    const task = TodoistTask(
      id: 6031974229,
      projectId: 2286844284,
      content: 'Read https://germanwithlaura.com/declension/',
      url: 'https://todoist.com/showTask?id=6031974229',
      completed: false,
      due: TodoistTaskDueTime(
        dateStr: '2022-07-31',
        datetimeStr: '2022-07-31T10:30:00',
        recurring: true,
        lang: 'ru',
        string: 'каждый день в 10:30',
      ),
    );

    expect(task.date, equals(DateTime(2022, 07, 31)));
  });

  test('datetime property', () {
    const task = TodoistTask(
      id: 6031974229,
      projectId: 2286844284,
      content: 'Read https://germanwithlaura.com/declension/',
      url: 'https://todoist.com/showTask?id=6031974229',
      completed: false,
      due: TodoistTaskDueTime(
        dateStr: '2022-07-31',
        datetimeStr: '2022-07-31T10:30:00',
        recurring: true,
        lang: 'ru',
        string: 'каждый день в 10:30',
      ),
    );

    expect(task.datetime, equals(DateTime(2022, 07, 31, 10, 30, 00)));
  });
}
