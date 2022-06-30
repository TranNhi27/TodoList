import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/update_task/components/edit_task_form.dart';



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EditTaskForm(),
      ],
    );
  }
}
