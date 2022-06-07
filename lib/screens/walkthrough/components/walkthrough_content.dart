import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class WalkthroughContent extends StatelessWidget {
  const WalkthroughContent({
    Key? key,
    required this.image,
    required this.header,
    required this.content,
  }) : super(key: key);

  final String image, header, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image,
          height: getProportionateScreenHeight(252),
          width: getProportionateScreenWidth(305),
        ),
        SizedBox(height: getProportionateScreenHeight(50),),
        Text(header,
          style: headingStyle,
        ),
        SizedBox(height: getProportionateScreenHeight(9),),
        Text(content,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: kTextColor.withOpacity(0.8)
          ),
        ),
      ],
    );
  }
}