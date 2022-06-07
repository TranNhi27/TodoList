import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
import 'count_box.dart';
import 'profile_card.dart';
import 'satistic_box.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: k16Padding),
          child: Column(
            children: [
              ProfileCard(
                avatar: 'assets/images/profile.jpg',
                name: 'Hayden',
                email: 'hayden@gm.com',
              ),
              CountBox(),
              StatisticBox()
            ],
          ),
        ),
      ),
    );
  }
}
