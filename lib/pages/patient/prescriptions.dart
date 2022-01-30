import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class Prescriptions extends StatefulWidget {
  const Prescriptions({Key key}) : super(key: key);

  @override
  _PrescriptionsState createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Prescriptions";
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
