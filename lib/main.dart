import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todocalendarist/base/app_config.dart';
import 'package:todocalendarist/model/todoist_task.dart';
import 'package:todocalendarist/todoist/todoist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
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
  MyCalendarDataSource? _dataSource;

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _initAsync() async {
    final todoist = Todoist(AppConfig(
        todoistAccessToken: FlutterConfig.get('TODOIST_TEST_ACCESS_TOKEN')));
    final tasksRes = await todoist.getTasks();
    final tasks = tasksRes.unwrap();
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
  final List<TodoistTask> _tasks;

  MyCalendarDataSource(List<TodoistTask> tasks)
      : _tasks = tasks.where((task) => task.datetime != null).toList() {
    appointments = _tasks;
  }

  @override
  DateTime getStartTime(int index) {
    return _tasks[index].datetime!;
  }

  @override
  DateTime getEndTime(int index) {
    return _tasks[index].datetime!.add(const Duration(minutes: 30));
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
