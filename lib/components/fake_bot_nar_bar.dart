import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';


class FakeBotNarBar extends StatelessWidget {
  const FakeBotNarBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: getProportionateScreenHeight(60),
        width: double.infinity,
        color: kNavBarColor,
      ),
    );
  }
}
