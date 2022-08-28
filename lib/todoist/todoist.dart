import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todocalendarist/utils/app_config_provider.dart';
import 'package:todocalendarist/base/general_error.dart';
import 'package:todocalendarist/base/result.dart';
import 'package:todocalendarist/model/todoist_task.dart';

class Todoist {
  final String _accessToken;
  final _dio = Dio(BaseOptions(baseUrl: 'https://api.todoist.com/'));

  Todoist(AppConfigProvider appConfigProvider)
      : _accessToken = appConfigProvider.appConfig().todoistAccessToken;

  Future<Result<List<TodoistTask>, GeneralError>> fetchTasks() async {
    final Response response;
    try {
      response = await _dio.get('rest/v1/tasks',
          options: Options(headers: {'Authorization': 'Bearer $_accessToken'}));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Err(GeneralError.network);
    }
    final tasks = <TodoistTask>[];
    for (final respJsonItem in response.data) {
      tasks.add(TodoistTask.fromJson(respJsonItem));
    }
    return Ok(tasks);
  }
}
