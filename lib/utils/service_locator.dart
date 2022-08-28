import 'package:get_it/get_it.dart';
import 'package:todocalendarist/utils/app_config_provider.dart';
import 'package:todocalendarist/tasks/tasks_manager.dart';
import 'package:todocalendarist/todoist/todoist.dart';
import 'package:todocalendarist/utils/time_provider.dart';

void registerLocatedServices() {
  GetIt.I.registerSingleton(AppConfigProvider());
  GetIt.I.registerSingleton(TimeProvider());
  GetIt.I.registerSingleton(Todoist(_get<AppConfigProvider>()));
  GetIt.I
      .registerSingleton(TasksManager(_get<Todoist>(), _get<TimeProvider>()));
}

T _get<T extends Object>() {
  return GetIt.I.get<T>();
}
