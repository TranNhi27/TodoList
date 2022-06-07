import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultElevatedBtn extends StatelessWidget {
  const DefaultElevatedBtn({
    Key? key,
    required this.textBtn,
    required this.press,
  }) : super(key: key);

  final String textBtn;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(48),
      child: ElevatedButton(
          onPressed: press,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          child: Text(
            textBtn,
            style: TextStyle(fontSize: 18,
                color: kTextColor
            ),
          )),
    );
  }
}