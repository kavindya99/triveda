import 'package:ayu/pages/profile.dart';
import 'package:flutter/material.dart';

import '../../styles/appBar.dart';
import '../../styles/variables.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Change Password";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update';
    final callFunction = Profile();
    final topPadding = 25.0;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                spaceBetweenInputFields,
                inputFields('Current Password'),
                SizedBox(
                  height: 50.0,
                ),
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
