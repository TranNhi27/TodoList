import 'package:flutter/material.dart';
import 'package:todo_list_app/components/appbar_title.dart';
import 'package:todo_list_app/constants.dart';
import 'components/body.dart';

class AddCheckListScreen extends StatelessWidget {
  const AddCheckListScreen({Key? key}) : super(key: key);
  static String routeName = '/addCheckList';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppbarTitle(title: 'Add Check List', color: Colors.white,),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}


