import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class ChannelingDoctor extends StatefulWidget {
  const ChannelingDoctor({Key key}) : super(key: key);

  @override
  _ChannelingDoctorState createState() => _ChannelingDoctorState();
}

class _ChannelingDoctorState extends State<ChannelingDoctor> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Doctor Channeling";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg-forms.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: bgColor,
        drawer: NavigationDrawer(),
        appBar:
            appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
      ),
    );
  }
}
