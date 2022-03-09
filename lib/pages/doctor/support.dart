import 'package:ayu/pages/main_menu_doctor.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import '../main_menu_patient.dart';

class SupportDoctor extends StatefulWidget {
  const SupportDoctor({Key key}) : super(key: key);

  @override
  _SupportDoctorState createState() => _SupportDoctorState();
}

class _SupportDoctorState extends State<SupportDoctor> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Support";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Send';
    final callFunction = MainMenuDoctor();
    final topPadding = 20.0;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
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
                inputFields('Name'),
                spaceBetweenInputFields,
                inputFields('Email'),
                spaceBetweenInputFields,
                inputFields('Subject'),
                spaceBetweenInputFields,
                inputFields('Description'),
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
