import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: labelTextStyle,
        hintText: 'Enter your email'
      ),
    ));
  }
}
