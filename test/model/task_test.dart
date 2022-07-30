import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/model/task.dart';

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
      "url": "https://todoist.com/showTask?id=6031974229"
    }
    ''';

    final decodedTask = Task.fromJson(jsonDecode(json));
    const expectedTask = Task(
      id: 6031974229,
      projectId: 2286844284,
      content: 'Read https://germanwithlaura.com/declension/',
      url: 'https://todoist.com/showTask?id=6031974229',
      completed: false,
    );

    expect(decodedTask, equals(expectedTask));
  });
}
