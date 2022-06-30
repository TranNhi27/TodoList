import 'package:flutter/material.dart';
import 'package:todo_list_app/components/task_list.dart';
import 'package:todo_list_app/database/Task_db.dart';
import 'package:todo_list_app/models/Task.dart';
import 'package:todo_list_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();

}

class _BodyState extends State<Body> {
  List<Task> tasks = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    refreshTasks();

  }

  Future refreshTasks() async {
    setState(() => isLoading = true);

    this.tasks = await TaskDatabase.instance.readAllTask();

    setState(() => isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenWidth(16)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskList(taskList: tasks),
              // DayDetailText(day: 'Tomorrow, ${formattedDate.format(DateTime.parse(DateTime(now.year, now.month, now.day + 1).toString()))}',),
              // TaskList(taskList: monthTaskList),
            ],
          ),
        ),
      ),
    );
  }
}
