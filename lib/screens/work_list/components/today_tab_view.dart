import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/database/Task_db.dart';
import 'package:todo_list_app/models/Task.dart';
import '../../../size_config.dart';
import 'day_detail_text.dart';
import '../../../components/task_list.dart';


class TodayTabView extends StatefulWidget {
  const TodayTabView({Key? key}) : super(key: key);

  @override
  State<TodayTabView> createState() => _TodayTabViewState();
}

class _TodayTabViewState extends State<TodayTabView> {
  List<Task> tasks = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshTasks();

  }

  Future refreshTasks() async {
    setState(() => isLoading = true);

    this.tasks = await TaskDatabase.instance.readTodayTask();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd('en_US');
    final now = DateTime.now();
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DayDetailText(day: 'Today, ${formattedDate.format(DateTime.parse(DateTime(now.year, now.month, now.day).toString()))}'),
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





