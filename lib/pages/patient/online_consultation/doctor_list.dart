import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import '../../doctor_profile.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key key}) : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Doctor List";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = "Doctor's Name";
    final callFunction = DoctorProfile();
    final topPadding = 0.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Container(
            child: Column(
              children: [
                Text(
                  'Click on doctor’s name to book an appointment for online consultation and also you can get their details',
                  style: TextStyle(fontSize: 16.00, color: primaryColor),
                ),
                spaceBetweenInputFields,
                inputFields('Search'),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
