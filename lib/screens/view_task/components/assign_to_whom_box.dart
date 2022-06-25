import 'package:flutter/material.dart';
import 'package:todo_list_app/models/Task.dart';
import 'package:todo_list_app/models/User.dart';
import '../../../constants.dart';
import 'config_title_with_list_tile.dart';

class AssignToWhomBox extends StatelessWidget {
  const AssignToWhomBox({
    Key? key, required this.task,
  }) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ConfigTitleWithListTile(
        title: 'Assigned to',
        leading: CircleAvatar(
          backgroundImage: AssetImage(users[0].avatar),
        ),
        subChild: Text(
          users[0].name,
          style: bold16Text,
        ));
  }
}

