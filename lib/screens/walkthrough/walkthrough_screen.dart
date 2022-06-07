import 'package:flutter/material.dart';
import 'components/body.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);
  static String routeName = '/walkthrough';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
