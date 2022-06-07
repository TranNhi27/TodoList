import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.projectTitle,
    required this.totalTask,
    required this.color,
  }) : super(key: key);

  final String projectTitle;
  final int totalTask;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenWidth(24)),
      height: getProportionateScreenHeight(180),
      width: getProportionateScreenWidth(165),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color.fromRGBO(227, 227, 227, 0.5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildColorDot(color: color),
          Spacer(flex: 3,),
          Text(
            projectTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 1,),
          Text(
            '$totalTask Tasks',
            style: TextStyle(color: kTextColor.withOpacity(0.8)),
          )
        ],
      ),
    );
  }

  Container buildColorDot({required Color color}) {
    return Container(
      width: getProportionateScreenWidth(26),
      height: getProportionateScreenWidth(26),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
              color: Color(0xFFDBDDEF), width: getProportionateScreenWidth(5))),
    );
  }
}