import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class AddBox extends StatelessWidget {
  const AddBox({
    Key? key, required this.press,
  }) : super(key: key);

  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: getProportionateScreenWidth(80),
        height: getProportionateScreenWidth(80),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
