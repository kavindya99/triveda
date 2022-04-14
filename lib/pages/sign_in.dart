import 'package:ayu/pages/forget_password.dart';
import 'package:ayu/pages/main_menu_doctor.dart';
import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/pages/sign_up_doctor.dart';
import 'package:ayu/pages/sign_up_patient.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final textTitle = 'SIGN IN';

    final buttonText = 'Sign In';
    //final callFunction = MainMenu();
    final callFunction = MainMenuDoctor();
    final topPadding = 5.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarMain(textTitle, ''),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                inputFields('Email'),
                spaceBetweenInputFields,
                inputFields('Password'),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: primaryColor,
                        shadows: [
                          letterShadow,
                        ],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't you have an account?",
                            style: TextStyle(
                              color: secondaryColorOne,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpDoctor()),
                              );
                            },
                            child: Text(
                              "Doctor",
                              style: TextStyle(
                                color: primaryColor,
                                shadows: [
                                  letterShadow,
                                ],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            "or ",
                            style: TextStyle(
                              color: secondaryColorOne,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              "Patient",
                              style: TextStyle(
                                color: primaryColor,
                                shadows: [
                                  letterShadow,
                                ],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
