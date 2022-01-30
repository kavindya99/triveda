import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/navigationDrawer.dart';

class OnlineYogaClass extends StatefulWidget {
  const OnlineYogaClass({Key key}) : super(key: key);

  @override
  _OnlineYogaClassState createState() => _OnlineYogaClassState();
}

class _OnlineYogaClassState extends State<OnlineYogaClass> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Online Yoga Class";
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
