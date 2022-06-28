import 'package:flutter/material.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/components/title_with_detail.dart';
import 'package:todo_list_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:todo_list_app/screens/home/home_screen.dart';
import 'package:todo_list_app/screens/sign_in/components/sign_in_form.dart';
import 'package:todo_list_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2,),
            TitleWithDetail(
              title: 'Welcome back',
              detail: 'Sign in to continue',
            ),
            SignInForm(),
            SizedBox(height: getProportionateScreenHeight(12),),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: Text(
                  'Forget Password',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Spacer(flex: 2,),
            DefaultTextButton(
              text: 'Log In',
              press: () {
                Navigator.popAndPushNamed(context, HomeScreen.routeName);
              },
            ),
            Spacer(flex: 4,),
          ],
        ),
      ),
    );
  }
}
