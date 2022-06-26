import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import 'config_title_with_list_tile.dart';

class DueDateBox extends StatelessWidget {
  const DueDateBox({
    Key? key,
    required this.dateTime,
    required this.time,
  }) : super(key: key);
  final String dateTime;
  final String time;
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(dateTime));
    String hourTime = time;
    return ConfigTitleWithListTile(
        title: 'Due Date',
        leading: Icon(Icons.calendar_today),
        subChild: Text(
          formattedDate + " " + hourTime,
          style: bold16Text,
        ),
    );
  }
}