import 'package:flutter/material.dart';
import 'package:todo_list_app/size_config.dart';
import 'project_board.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
          child: ProjectBoard(),
        ),
      ),
    );
  }
}




