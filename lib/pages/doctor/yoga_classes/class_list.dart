import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key key}) : super(key: key);

  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Yoga Classes";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/sub-back.png"),
                  fit: BoxFit.fitHeight),
            ),
            child: Column(
              children: [
                spaceBetweenInputFields,
                listViewYoga('Class 1', "Jennifer Ronly", '2022.08.06.',
                    '4.00 - 4.30', 'click to join meeting'),
                spaceBetweenInputFields,
                listViewYoga('Class 2', "Jennifer Ronly", '2022.08.06.',
                    '4.00 - 4.30', 'click to join meeting'),
                spaceBetweenInputFields,
                listViewYoga('Class 3', "Jennifer Ronly", '2022.08.06.',
                    '4.00 - 4.30', 'click to join meeting'),
                spaceBetweenInputFields,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
