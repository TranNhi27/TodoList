import 'package:flutter/material.dart';
import '../../../size_config.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    Key? key,
    required this.choiceText,
  }) : super(key: key);
  final String choiceText;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: getProportionateScreenHeight(80),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFE4E4E4),
                    style: BorderStyle.solid))),
        child: Center(
          child: Text(
            choiceText,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
