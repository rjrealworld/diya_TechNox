import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

import 'Screens/Login/login_screen.dart';

void main() => runApp(LogApp());

class LogApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }
}
