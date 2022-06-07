import 'package:flutter/material.dart';
import '../constants.dart';
import '../size_config.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(48),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color
      ),
      child: TextButton(
          onPressed: press,
          child: Text(text,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white
            ),)),
    );
  }
}