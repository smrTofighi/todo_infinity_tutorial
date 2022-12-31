import 'package:flutter/material.dart';
import 'package:todo_infinity_tutorial/core/values/colors.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(
      {super.key,
      required this.taskController,
      required this.onSaved,
      required this.onCanceled});
  final TextEditingController taskController;
  final Function() onSaved;
  final Function() onCanceled;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: SolidColors.backGround,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: SolidColors.primary,
                  onPressed: onSaved,
                  child: const Text('Save'),
                ),
                MaterialButton(
                  color: SolidColors.primary,
                  onPressed: onCanceled,
                  child: const Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
