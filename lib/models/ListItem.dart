import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';

class CheckListItem {
  String content;
  bool isChecked;
  Color color;
  List<CheckListItem>? listItem;
  CheckListItem({
    this.content = '',
    this.isChecked = false,
    this.color = kSecondaryColor,
    this.listItem
  });
}

List<CheckListItem> listItems = [
  CheckListItem(content: 'Meeting with Jessica in Central Park at 10:30PM',color: kSecondaryColor),
  CheckListItem(content: 'Replace dashboard icon with more colorful ones',color: kDarkPink),
];