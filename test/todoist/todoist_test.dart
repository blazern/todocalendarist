import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/base/app_config.dart';
import 'package:todocalendarist/todoist/todoist.dart';

void main() {
  late AppConfig appConfig;

  setUp(() async {
    dotenv.testLoad(fileInput: await File('.env').readAsString());
    appConfig =
        AppConfig(todoistAccessToken: dotenv.get('TODOIST_TEST_ACCESS_TOKEN'));
  });

  test('getTasks', () async {
    final todoist = Todoist(appConfig);
    final tasksRes = await todoist.getTasks();
    final tasks = tasksRes.unwrap();
    expect(tasks.length, greaterThan(1), reason: tasks.toString());
  });
}
