import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/Body.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);
  static String routeName ='/logo';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
