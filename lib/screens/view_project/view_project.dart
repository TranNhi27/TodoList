import 'package:flutter/material.dart';
import 'package:todo_list_app/components/appbar_title.dart';
import 'package:todo_list_app/constants.dart';
import 'components/body.dart';
class ViewProjectScreen extends StatelessWidget {
  const ViewProjectScreen({Key? key}) : super(key: key);
  static String routeName = '/viewProject';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: AppbarTitle(title: 'Project', color: Colors.white),
      ),
      body: Body(),
      extendBody: true,
    );
  }
}
