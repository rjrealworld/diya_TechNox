import 'package:flutter/material.dart';
import 'package:diya/Screens/Login/login_screen.dart';
import 'package:diya/Screens/Signup/components/background.dart';
import 'package:diya/components/already_have_an_account_acheck.dart';
import 'package:diya/components/rounded_button.dart';
import 'package:diya/components/rounded_input_field.dart';
import 'package:diya/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:diya/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';

  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                validate: (value) => value.isEmpty ? 'Enter an email' : null,
                hintText: "Your Email",
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              RoundedPasswordField(
                validate: (value) =>
                    value.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);

                    if (result == null) {
                      setState(() => error = 'Provide valid credentials');
                    }

                    // else {
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return HomeScreen();
                    //     },
                    //   );
                    //
                    // }

                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
