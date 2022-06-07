import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/work_list/components/month_tab_view.dart';
import 'today_tab_view.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: [
          TodayTabView(),
          MonthTabView()
    ]);
  }
}

