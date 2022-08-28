import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todocalendarist/model/task.dart';
import 'package:todocalendarist/model/todoist_task.dart';
import 'package:todocalendarist/utils/service_locator.dart';
import 'package:todocalendarist/tasks/tasks_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  registerLocatedServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tasksManager = GetIt.I.get<TasksManager>();
  MyCalendarDataSource? _dataSource;

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _initAsync() async {
    final tasksRes = await _tasksManager.fetchTasks();
    final tasks = tasksRes.unwrap().tasks;
    setState(() {
      _dataSource = MyCalendarDataSource(tasks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _dataSource == null
          ? const CircularProgressIndicator()
          : SfCalendar(dataSource: _dataSource),
    );
  }
}

class MyCalendarDataSource extends CalendarDataSource<TodoistTask> {
  final List<Task> _tasks;

  MyCalendarDataSource(List<Task> tasks)
      : _tasks = tasks.where((task) => task.nextDatetime != null).toList() {
    appointments = _tasks;
  }

  @override
  DateTime getStartTime(int index) {
    return _tasks[index].nextDatetime!;
  }

  @override
  DateTime getEndTime(int index) {
    return _tasks[index].nextDatetime!.add(const Duration(minutes: 30));
  }

  @override
  String getSubject(int index) {
    return _tasks[index].content;
  }

  @override
  Color getColor(int index) {
    return Colors.blue;
  }
}
