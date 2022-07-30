import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todocalendarist/base/app_config.dart';
import 'package:todocalendarist/base/result.dart';
import 'package:todocalendarist/model/task.dart';

class Todoist {
  final AppConfig _appConfig;

  final _dio = Dio(BaseOptions(
    baseUrl: 'https://api.todoist.com/'
  ));

  Todoist(this._appConfig);

  Future<Result<List<Task>, String>> getTasks() async {
    final accessToken = _appConfig.todoistAccessToken;
    final Response response;
    try {
      response =
      await _dio.get('rest/v1/tasks', options: Options(headers: {
        'Authorization': 'Bearer $accessToken'
      }));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Err(e.message);
    }
    final tasks = <Task>[];
    for (final respJsonItem in response.data) {
      tasks.add(Task.fromJson(respJsonItem));
    }
    return Ok(tasks);
  }
}