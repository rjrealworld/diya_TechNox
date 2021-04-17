import 'package:diya/screens/Login/login_screen.dart';
import 'package:diya/screens/wrapper.dart';
import 'package:diya/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diya/models/user.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: Wrapper(),
    );
  }
}
