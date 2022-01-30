import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnlineConsultaion extends StatefulWidget {
  const OnlineConsultaion({Key key}) : super(key: key);

  @override
  _OnlineConsultaionState createState() => _OnlineConsultaionState();
}

class _OnlineConsultaionState extends State<OnlineConsultaion> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Online Consultation";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar:
          appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(),
        ),
      ),
    );
  }
}
