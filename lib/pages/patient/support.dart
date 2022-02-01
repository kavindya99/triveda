import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/variables.dart';

class SupportPatient extends StatefulWidget {
  const SupportPatient({Key key}) : super(key: key);

  @override
  _SupportPatientState createState() => _SupportPatientState();
}

class _SupportPatientState extends State<SupportPatient> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Support";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Send';
    final callFunction = MainMenu();
    final topPadding = 20.0;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar:
          appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
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
