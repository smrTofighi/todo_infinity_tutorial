import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_infinity_tutorial/pages/main_page.dart';

void main() async {
  //! init the hive with hive flutter package
  await Hive.initFlutter();
  //! open a box
  // ignore: unused_local_variable
  var box = await Hive.openBox('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Infinity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MainPage(),
    );
  }
}
