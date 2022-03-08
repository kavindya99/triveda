import 'package:ayu/pages/patient/yoga/online_yoga_class.dart';
import 'package:ayu/pages/patient/yoga/yoga_poses_types.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
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

    final buttonText1 = 'Yoga Posses';
    final callFunction1 = YogaPoses();
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
                      "images/practice-yoga.gif",
                      height: 180.0,
                      width: 220.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Practice Yoga',
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
                      'Do your practice of physical exercises',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'and relaxation',
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
