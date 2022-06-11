import 'package:flutter/material.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/components/title_with_detail.dart';
import 'package:todo_list_app/screens/forgot_password/components/forgot_password_form.dart';
import 'package:todo_list_app/screens/reset_password/reset_password_screen.dart';
import 'package:todo_list_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
      child: Column(
        children: [
          Spacer(flex: 2,),
          TitleWithDetail(
              title: 'Forgot Password',
              detail: 'Please enter your email below to receive your password reset instructions'),
          ForgotPasswordForm(),
          SizedBox(height: getProportionateScreenHeight(32),),
          DefaultTextButton(
              text: 'Send Request',
              press: () {
                Navigator.pushNamed(context, ResetPasswordScreen.routeName);
              }),
          Spacer(flex: 7,),
        ],
      ),
    );
  }
}
