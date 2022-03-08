import 'package:ayu/pages/patient/yoga/doctor_list.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';

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

    final buttonText1 = 'Doctor List';
    final callFunction1 = DoctorList();
    final buttonText2 = 'Online Yoga Classes';
    final callFunction2 = OnlineYogaClass();
    final topPadding1 = 10.0;
    final topPadding2 = 0.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/online-yoga-class.gif",
                      height: 200.0,
                      width: 250.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Yoga Class',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You can have classes for yoga via online',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText1, context, callFunction1, topPadding1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText2, context, callFunction2, topPadding2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
