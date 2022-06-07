import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';

import 'components/body.dart';

class ViewTaskScreen extends StatelessWidget {
  const ViewTaskScreen({Key? key}) : super(key: key);
  static String routeName = '/viewTask';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(
      ),
    );
  }
}
