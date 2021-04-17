import 'package:diya/Homepage/main.dart';
import 'package:diya/screens/Dashboard/dashboard.dart';
import 'package:diya/screens/authenticate/loading.dart';
import 'package:flutter/material.dart';
import 'package:diya/Screens/Login/components/background.dart';
import 'package:diya/Screens/Signup/signup_screen.dart';
import 'package:diya/components/already_have_an_account_acheck.dart';
import 'package:diya/components/rounded_button.dart';
import 'package:diya/components/rounded_input_field.dart';
import 'package:diya/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:diya/services/auth.dart';


class Body extends StatefulWidget {

   Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

   String email = '';

   String password = '';

   String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? Loading() : Background(
      child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  validate: (value) =>
                  value.isEmpty ? 'Enter an email' : null,
                  hintText: "Email",
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                RoundedPasswordField(
                  validate: (value) => value.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () async{

                    if (_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Sign in with valid credentials';
                        });
                        }
                      }

                      else {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                      }
                    }

                  // press: () {
                  //
                  //   Navigator.of(context)
                  //       .pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
                  // },
                ),

                SizedBox(height: size.height * 0.03),

                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
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
              ],
            ),
          ),
        ),
      );
  }
}
