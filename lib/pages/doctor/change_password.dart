import 'package:ayu/pages/doctor_profile.dart';
import 'package:ayu/pages/profile.dart';
import 'package:flutter/material.dart';

import '../../styles/appBar.dart';
import '../../styles/navigationDrawerPatient.dart';
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
    final callFunction = DoctorProfile();
    final topPadding = 25.0;
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawer(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter your current password, new password and type it again to confirm the newly entered password.',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                inputFields('Current Password'),
                spaceBetweenInputFields,
                inputFields('New Password'),
                spaceBetweenInputFields,
                inputFields('Confirm Password'),
                spaceBetweenInputFields,
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
