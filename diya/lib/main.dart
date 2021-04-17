import 'package:diya/screens/wrapper.dart';
import 'package:diya/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:diya/providers/color_provider.dart';
import 'package:diya/screens/onboarding/onboarding.dart';
import 'package:diya/themes/styles.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diya',
      theme: appTheme(),
      home: Home(),
    );
  }
}

 class Home extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body: ChangeNotifierProvider(
       create: (context) => ColorProvider(),
      child: Onboarding(),
      ),
    );
 }
 }
