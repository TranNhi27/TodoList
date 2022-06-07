import 'package:flutter/material.dart';
import 'package:todo_list_app/components/fake_bot_nar_bar.dart';
import 'view_task_detail.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          FakeBotNarBar(),
          ViewTaskDetail()
        ],
      ),
    );
  }
}