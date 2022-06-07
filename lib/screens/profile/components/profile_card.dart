import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'cus_title_with_sub.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.avatar,
  }) : super(key: key);

  final String name, email, avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10),
          left: k24Padding,
          bottom: k24Padding),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color.fromRGBO(224, 224, 224, 0.5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: GestureDetector(
              child: Icon(Icons.settings),
              onTap: () {
                //
              },
            ),
            alignment: Alignment.topRight,
          ),
          Row(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(64),
                width: getProportionateScreenWidth(64),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    avatar,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CusTitleAndSub(
                title: name,
                subTitle: email,
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              CusTitleAndSub(title: '120', subTitle: 'Create Tasks'),
              SizedBox(width: 50),
              CusTitleAndSub(title: '80', subTitle: 'Completed Tasks')
            ],
          )
        ],
      ),
    );
  }
}
