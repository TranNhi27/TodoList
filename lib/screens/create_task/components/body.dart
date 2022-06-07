import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/components/background_container.dart';
import 'package:todo_list_app/components/fake_bot_nar_bar.dart';
import 'task_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundContainer(),
        FakeBotNarBar(),
        TaskForm(),
      ],
    );
  }


}


