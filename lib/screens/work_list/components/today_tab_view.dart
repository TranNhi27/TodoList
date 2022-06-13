import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/models/Task.dart';
import '../../../size_config.dart';
import 'day_detail_text.dart';
import '../../../components/task_list.dart';


class TodayTabView extends StatelessWidget {
  const TodayTabView({Key? key}) : super(key: key);

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
              TaskList(taskList: taskList),
              DayDetailText(day: 'Tomorrow, ${formattedDate.format(DateTime.parse(DateTime(now.year, now.month, now.day + 1).toString()))}',),
              TaskList(taskList: monthTaskList),
            ],
          ),
        ),
      ),
    );
  }
}





