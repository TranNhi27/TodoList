import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/confirmed.png'),
          SizedBox(height: getProportionateScreenHeight(40),),
          Text('Succesful!',
            style: headingStyle,
          ),
          SizedBox(height: getProportionateScreenHeight(10),),
          Text('You have successfully change password.\nPlease use your new passwords when\n logging in',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
