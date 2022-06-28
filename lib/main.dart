import 'package:flutter/material.dart';
import 'package:todo_list_app/api/notification_api.dart';
import 'package:todo_list_app/routes.dart';
import 'package:todo_list_app/screens/logo/logo_screen.dart';
import 'theme.dart';

void main() async {
  runApp(MyApp());
  await NotificationApi.init(); // <----
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: LogoScreen.routeName,
      routes: routes,
    );
  }
}
