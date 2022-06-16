import 'package:flutter/material.dart';
import 'package:todo_list_app/components/background_container.dart';
import 'check_list_board.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundContainer(),
        CheckListBoard(),
      ],
    );
  }
}


