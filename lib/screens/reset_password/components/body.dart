import 'package:flutter/material.dart';
import 'package:todo_list_app/components/default_text_button.dart';
import 'package:todo_list_app/components/title_with_detail.dart';
// import 'package:todo_list_app/screens/changed_pass_successfully/success_screen.dart';
import 'package:todo_list_app/screens/reset_password/components/reset_password_form.dart';
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
              title: 'Reset Password',
              detail: 'Reset code was sent to your phone. Please enter the code and create new password'),
          ResetPasswordForm(),
          Spacer(flex: 2,),
          DefaultTextButton(text: 'Change Password', press: () {
            // Navigator.pushNamed(context, SuccessScreen.routeName);
          }),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}
