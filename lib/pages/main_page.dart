import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_infinity_tutorial/core/values/colors.dart';
import 'package:todo_infinity_tutorial/database.dart';
import 'package:todo_infinity_tutorial/pages/widgets/dialog_box_widget.dart';
import 'package:todo_infinity_tutorial/pages/widgets/todo_tile_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

// ignore: unused_element
final _taskBox = Hive.box('taskBox');
TaskDataBase db = TaskDataBase();
final TextEditingController _controller = TextEditingController();

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    db.loadData();
  }

  void checkBoxCompleted(int index, bool? value) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          taskController: _controller,
          onCanceled: () => Navigator.of(context).pop(),
          onSaved: saveNewTask,
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      db.taskList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.text = '';
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.backGround,
        appBar: AppBar(
          backgroundColor: SolidColors.primary,
          title: const Text(
            'TO DO',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: db.taskList.isNotEmpty
            ? ListView.builder(
                itemCount: db.taskList.length,
                itemBuilder: (context, index) => ToDoTile(
                  takeName: db.taskList[index][0],
                  taskCompleted: db.taskList[index][1],
                  onChanged: (value) => checkBoxCompleted(index, value),
                  deleteTask: (context) => deleteTask(index),
                ),
              )
            : const Center(
                child: Text('NO TASK'),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: SolidColors.primary,
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
