import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class ChannelDoctor extends StatefulWidget {
  const ChannelDoctor({Key key}) : super(key: key);

  @override
  _ChannelDoctorState createState() => _ChannelDoctorState();
}

class _ChannelDoctorState extends State<ChannelDoctor> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Channel a Doctor";
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
