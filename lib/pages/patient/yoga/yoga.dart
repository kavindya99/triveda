import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class Yoga extends StatefulWidget {
  const Yoga({Key key}) : super(key: key);

  @override
  _YogaState createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Yoga";
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
