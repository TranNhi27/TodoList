import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key? key, required this.choice, required this.press})
      : super(key: key);

  final DropdownChoice choice;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(14),
          vertical: 0
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              choice.choiceText,
              style: TextStyle(
                  fontSize: 17,
                  color: kTextColor,
                  fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset('assets/icons/checked.svg',
              color: choice.isSelected ? Color(0xFF7ED321) : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class DropdownChoice {
  bool isSelected = false;
  final String choiceText;

  DropdownChoice({required this.choiceText, });
}