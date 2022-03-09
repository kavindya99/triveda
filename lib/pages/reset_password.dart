import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/variables.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final buttonText = 'Reset';
    final callFunction = SignIn();
    final topPadding = 25.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarMain('RESET', ''),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                spaceBetweenInputFields,
                inputFields('New Password'),
                SizedBox(
                  height: 50.0,
                ),
                inputFields('Confirm Password'),
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
