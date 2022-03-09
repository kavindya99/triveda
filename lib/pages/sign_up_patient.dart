import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final textTitleMain = 'SIGN UP';
    final textTitleSub = 'Patient';

    final buttonText = 'Sign Up';
    final callFunction = SignIn();
    final topPadding = 25.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarMain(textTitleMain, textTitleSub),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                inputFields('Name'),
                spaceBetweenInputFields,
                inputFields('Email'),
                spaceBetweenInputFields,
                inputFields('Password'),
                spaceBetweenInputFields,
                inputFields('Province'),
                spaceBetweenInputFields,
                inputFields('District'),
                spaceBetweenInputFields,
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: secondaryColorOne,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: primaryColor,
                            shadows: [
                              letterShadow,
                            ],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
