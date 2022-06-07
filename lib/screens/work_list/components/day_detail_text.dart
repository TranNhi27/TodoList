import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class DayDetailText extends StatelessWidget {
  const DayDetailText({
    Key? key, required this.day,
  }) : super(key: key);

  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(24),
          bottom: getProportionateScreenHeight(18)),
      child: Text(day.toUpperCase(),
        style: dayTextStyle,
      ),
    );
  }
}
