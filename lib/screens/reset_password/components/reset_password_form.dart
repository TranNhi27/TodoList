import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';
import 'package:todo_list_app/size_config.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(child:
    Column(
      children: [
        buildResetCodeFormField(),
        SizedBox(height: getProportionateScreenHeight(38),),
        buildNewPassFormField(),
        SizedBox(height: getProportionateScreenHeight(38),),
        buildConfirmPassFormField()
      ],
    ));
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Confirm password',
            labelStyle: labelTextStyle,
            hintText: 'Enter your confirm password'
        ),
      );
  }

  TextFormField buildNewPassFormField() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'New password',
            labelStyle: labelTextStyle,
            hintText: 'Enter your password'
        ),
      );
  }

  TextFormField buildResetCodeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 6,
      decoration: InputDecoration(
          labelText: 'Reset code',
          counterStyle: TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          labelStyle: labelTextStyle,
          hintText: 'Enter your number'),
    );
  }
}
