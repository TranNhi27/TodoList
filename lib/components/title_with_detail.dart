import 'package:flutter/material.dart';

import '../size_config.dart';

class TitleWithDetail extends StatelessWidget {
  const TitleWithDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title, detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(32),
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(12),),
        Text(detail,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: Color(0xFF9B9B9B)
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(48),),
      ],
    );
  }
}