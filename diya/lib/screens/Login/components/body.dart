import 'package:diya/Homepage/main.dart';
import 'package:flutter/material.dart';
import 'package:diya/Screens/Login/components/background.dart';
import 'package:diya/Screens/Signup/signup_screen.dart';
import 'package:diya/components/already_have_an_account_acheck.dart';
import 'package:diya/components/rounded_button.dart';
import 'package:diya/components/rounded_input_field.dart';
import 'package:diya/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:diya/services/auth.dart';


class Body extends StatelessWidget {
  final AuthService _auth = AuthService();
   Body({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('Sign in anon'),
              onPressed: () async{
                dynamic result = await _auth.signInAnon();

                if (result == null){
                  print('error');
                }

                else{
                  print('signed in');
                  print(result.uid);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
