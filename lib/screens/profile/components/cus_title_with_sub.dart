import 'package:flutter/material.dart';
import '../../../constants.dart';

class CusTitleAndSub extends StatelessWidget {
  const CusTitleAndSub({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RichText(
        text: TextSpan(
          text: '$title\n',
          style: TextStyle(color: kTextColor,fontWeight: FontWeight.bold, fontSize: 20),
          children: [
            TextSpan(text: subTitle,
              style: TextStyle(
                color: kTextColor.withOpacity(0.5),
                fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }
}