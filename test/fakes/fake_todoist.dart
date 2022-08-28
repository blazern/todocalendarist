import 'package:todocalendarist/base/general_error.dart';
import 'package:todocalendarist/base/result.dart';
import 'package:todocalendarist/model/todoist_task.dart';
import 'package:todocalendarist/todoist/todoist.dart';

class FakeTodoist implements Todoist {
  Result<List<TodoistTask>, GeneralError> _fetchedTasks = Ok(const []);

  void setFetchedTasks(Result<List<TodoistTask>, GeneralError> tasks) {
    _fetchedTasks = tasks;
  }

  @override
  Future<Result<List<TodoistTask>, GeneralError>> fetchTasks() async =>
      _fetchedTasks;
}
