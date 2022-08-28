import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todocalendarist/base/app_config.dart';
import 'package:todocalendarist/todoist/todoist.dart';

import '../fakes/fake_app_config_provider.dart';

void main() {
  late AppConfig appConfig;

  setUp(() async {
    dotenv.testLoad(fileInput: await File('.env').readAsString());
    appConfig =
        AppConfig(todoistAccessToken: dotenv.get('TODOIST_TEST_ACCESS_TOKEN'));
  });

  test('getTasks', () async {
    final todoist = Todoist(FakeAppConfigProvider(appConfig));
    final tasksRes = await todoist.fetchTasks();
    final tasks = tasksRes.unwrap();
    expect(tasks.length, greaterThan(1), reason: tasks.toString());
  });
}
