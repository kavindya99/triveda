import 'package:ayu/pages/reset_password.dart';
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
      appBar: appBarMain('FORGET', ''),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                inputFields('Email'),
                SizedBox(
                  height: 50.0,
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
