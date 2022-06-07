import 'package:flutter/material.dart';
import 'package:todo_list_app/components/appbar_title.dart';
import 'package:todo_list_app/constants.dart';
import 'components/body.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);
  static String routeName = '/menu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(
            title: 'Projects',
            color: kTextColor),
      ),
      body: Body(),
    );
  }
}
