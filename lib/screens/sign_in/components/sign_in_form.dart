import 'package:flutter/material.dart';
import 'package:todo_list_app/size_config.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(child: 
    Column(
      children: [
        buildEmailFormField(),
        SizedBox(height: getProportionateScreenHeight(32),),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: labelTextStyle,
            hintText: 'Enter your password',
          ),
        )
      ],
    ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: labelTextStyle,
          hintText: 'Enter your email',
        ),
      );
  }
}
