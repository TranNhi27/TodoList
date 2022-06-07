import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
import '../size_config.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    Key? key, required this.height, required this.child, required this.verticalPadding
  }) : super(key: key);
  final double height;
  final Widget child;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: EdgeInsets.symmetric(
          horizontal: k16Padding,
          vertical: getProportionateScreenHeight(6)),
      padding: EdgeInsets.symmetric(
          horizontal: k24Padding,
          vertical: verticalPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 3), blurRadius: 9, color: Color(0xFFDDDDDD))
          ]),
      child: child,
    );
  }
}