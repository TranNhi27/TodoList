import 'package:flutter/material.dart';
import 'package:todo_list_app/models/Task.dart';
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
          backgroundImage: AssetImage(task.assigneeAva),
        ),
        subChild: Text(
          task.assignee,
          style: bold16Text,
        ));
  }
}

