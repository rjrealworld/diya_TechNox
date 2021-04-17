import 'package:diya/Homepage/main.dart';
import 'package:diya/main.dart';
import 'package:diya/screens/Dashboard/dashboard.dart';
import 'package:diya/screens/Signup/signup_screen.dart';
import 'package:diya/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diya/models/user.dart';
import 'package:diya/screens/Login/login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null) {
      return SignUpScreen();
    }
    else {
      return HomeScreen();
    }
  }
}
