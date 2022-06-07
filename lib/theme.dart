import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';


ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Roboto",
      primarySwatch: Colors.blue,
      textTheme: textTheme(),
      appBarTheme: appBarTheme(),
      textButtonTheme: textButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      inputDecorationTheme: inputDecorationTheme(),
      checkboxTheme: checkboxThemeData(),
      unselectedWidgetColor: kSecondaryColor
  );
}

CheckboxThemeData checkboxThemeData() {
  return CheckboxThemeData(
    shape: CircleBorder(),
    // overlayColor: MaterialStateProperty.all<Color>(kSecondaryColor),

  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEDEDED))),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEDEDED))));
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    textStyle: TextStyle(fontWeight: FontWeight.bold),
  ));
}

TextButtonThemeData textButtonThemeData() {
  return TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: TextStyle(fontWeight: FontWeight.bold)));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20));
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}
