import 'package:hive_flutter/hive_flutter.dart';

class TaskDataBase {
  List taskList = [];

  final _taskBox = Hive.box('taskBox');

  void createInitalData() {}

  void loadData() {
    taskList = _taskBox.get('TASKLIST') ?? [];
    print(taskList.toString());
  }

  void updateDataBase() {
    _taskBox.put('TASKLIST', taskList);
  }
}
