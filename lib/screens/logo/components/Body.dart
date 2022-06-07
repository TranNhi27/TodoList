import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/walkthrough/walkthrough_screen.dart';
import 'package:todo_list_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  startTime() async {
    var duration = new Duration(milliseconds: 1000);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => WalkthroughScreen()
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.popAndPushNamed(context, WalkthroughScreen.routeName);
            },
            child: Image.asset('assets/images/Logo.png',
              height: getProportionateScreenWidth(149),
              width: getProportionateScreenWidth(149),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(12),),
          Text('asking',
            style: TextStyle(
              color: Color(0xFF010101),
              fontSize: getProportionateScreenWidth(48),
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
