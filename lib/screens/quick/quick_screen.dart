import 'package:flutter/material.dart';
import 'package:todo_list_app/components/appbar_title.dart';

import 'components/body.dart';

class QuickScreen extends StatelessWidget {
  const QuickScreen({Key? key}) : super(key: key);
  static String routeName = '/quick';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: Colors.white,
        title: AppbarTitle(title: 'Quick Notes', color: Colors.black),
      ),
      body: Body(),
    );
  }
}
