import 'package:flutter/widgets.dart';
import 'package:todo_list_app/screens/create_task/create_task_screen.dart';
import 'package:todo_list_app/screens/home/components/bottom_nar_bar.dart';
import 'package:todo_list_app/screens/home/home_screen.dart';
import 'package:todo_list_app/screens/logo/logo_screen.dart';
import 'package:todo_list_app/screens/menu/menu_screen.dart';
import 'package:todo_list_app/screens/profile/profile_screen.dart';
import 'package:todo_list_app/screens/quick/quick_screen.dart';
import 'package:todo_list_app/screens/sign_in/sign_in_screen.dart';
import 'package:todo_list_app/screens/view_task/view_task_screen.dart';
import 'package:todo_list_app/screens/walkthrough/walkthrough_screen.dart';
import 'package:todo_list_app/screens/work_list/work_list_screen.dart';
import 'package:todo_list_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:todo_list_app/screens/reset_password/reset_password_screen.dart';
import 'package:todo_list_app/screens/changed_pass_successfully/success_screen.dart';
import 'package:todo_list_app/screens/add_check_list/add_check_list_screen.dart';
import 'package:todo_list_app/screens/add_note/add_note_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LogoScreen.routeName: (context) => LogoScreen(),
  WalkthroughScreen.routeName: (context) => WalkthroughScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  WorklistScreen.routeName: (context) => WorklistScreen(),
  MenuScreen.routeName: (context) => MenuScreen(),
  QuickScreen.routeName: (context) => QuickScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CreateTaskScreen.routeName: (context) => CreateTaskScreen(),
  ViewTaskScreen.routeName: (context) => ViewTaskScreen(),
  CustomBotNavBar.routeName: (context) => CustomBotNavBar(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),  
  SuccessScreen.routeName: (context) => SuccessScreen(),
  AddNoteScreen.routeName: (context) => AddNoteScreen(),
  AddCheckListScreen.routeName: (context) => AddCheckListScreen(),
};