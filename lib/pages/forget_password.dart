import 'package:ayu/pages/reset_password.dart';
import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/variables.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final buttonText = 'Send';
    final callFunction = ResetPassword();
    final topPadding = 25.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarMain('FORGET', 'Password'),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 90.0, left: 30.0, right: 30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your email here.',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                Text(
                  'You can reset your password by the link we send you to your email',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                SizedBox(
                  height: 70.0,
                ),
                inputFields('Email'),
                spaceBetweenInputFields,
                buttonInPages(buttonText, context, callFunction, topPadding),
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
                          "BACK TO SIGN IN",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
