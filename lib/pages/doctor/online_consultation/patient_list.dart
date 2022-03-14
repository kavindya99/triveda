import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Patient List";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarComponent(
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
                listViewOnlineConsult('Patient 1', "Jennifer Ronly", 'Video',
                    '2022.08.06.', '4.00 - 4.30', 'click to join meeting'),
                spaceBetweenInputFields,
                listViewOnlineConsult('Patient 2', "Jennifer Ronly", 'Video',
                    '2022.08.06.', '4.00 - 4.30', 'click to join meeting'),
                spaceBetweenInputFields,
                listViewOnlineConsult('Patient 3', "Jennifer Ronly", 'Video',
                    '2022.08.06.', '4.00 - 4.30', 'click to join meeting'),
                spaceBetweenInputFields,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
