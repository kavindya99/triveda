import 'package:ayu/pages/patient/yoga/yoga_pose.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class YogaList extends StatefulWidget {
  const YogaList({Key key}) : super(key: key);

  @override
  _YogaListState createState() => _YogaListState();
}

class _YogaListState extends State<YogaList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Yoga Pose Related to \nSelected Type";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = "Yoga Pose Name";
    final callFunction = YogaPose();
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
