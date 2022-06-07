import 'package:flutter/material.dart';
import 'package:todo_list_app/components/appbar_title.dart';
import 'package:todo_list_app/constants.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(title: 'Profiles',color: kTextColor,),
      ),
      body: Body(),
    );
  }
}
