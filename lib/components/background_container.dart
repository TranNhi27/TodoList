import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(44),
      width: double.infinity,
      color: kPrimaryColor,
    );
  }
}
