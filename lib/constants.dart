import 'package:flutter/material.dart';
import 'package:todo_list_app/size_config.dart';

// Default color
const kPrimaryColor = Color(0xFFF96060);
const kSecondaryColor = Color(0xFF6074F9);
const kTextColor = Color(0xFF313131);
const kDayColor = Color(0xFF9A9A9A);
const kNavBarColor = Color(0xFF292E4E);

//
const kDarkPink = Color(0xFFE42B6A);
const kLightGreen = Color(0xFF5ABB56);
const kLightPurple = Color(0xFF8560F9);
const kDarkPurple = Color(0xFF3D3A62);
const kSkinColor = Color(0xFFF4CA8F);
const kGrayColor = Color(0xFFF4F4F4);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(24),
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

final bold18Text = TextStyle(
  fontSize: getProportionateScreenWidth(18),
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

final bold16Text = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

final List<Color> noteColors = [
  kSecondaryColor,
  kDarkPink,
  kLightGreen,
  kDarkPurple,
  kSkinColor,
];

final k16Padding = getProportionateScreenWidth(16);
final k24Padding = getProportionateScreenWidth(24);

final labelTextStyle = TextStyle(
    fontSize: getProportionateScreenWidth(20),
    height: -1,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );

const dayTextStyle = TextStyle(
  color: kDayColor,
  fontSize: 14,
);

final defaultBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(5),
  boxShadow: [
    BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 10,
        color: Color.fromRGBO(224, 224, 224, 0.5))
  ],
);
