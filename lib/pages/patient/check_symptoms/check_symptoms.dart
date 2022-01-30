import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class CheckSymptoms extends StatefulWidget {
  const CheckSymptoms({Key key}) : super(key: key);

  @override
  _CheckSymptomsState createState() => _CheckSymptomsState();
}

class _CheckSymptomsState extends State<CheckSymptoms> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Check Symptoms";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar:
          appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
    );
  }
}
