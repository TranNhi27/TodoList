import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    Key? key, required this.title, required this.color,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold
      ),
    );
  }
}