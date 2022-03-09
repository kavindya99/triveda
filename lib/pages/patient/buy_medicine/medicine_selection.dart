import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import 'medicine_details.dart';

class MedicineSelection extends StatefulWidget {
  const MedicineSelection({Key key}) : super(key: key);

  @override
  _MedicineSelectionState createState() => _MedicineSelectionState();
}

class _MedicineSelectionState extends State<MedicineSelection> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Medicine Selection";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = "Medicine's Name";
    final callFunction = Buy();
    final topPadding = 0.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Container(
            child: Column(
              children: [
                Text(
                  'You can search any medicine and buy',
                  style: TextStyle(fontSize: 16.00, color: primaryColor),
                ),
                spaceBetweenInputFields,
                inputFields('Search'),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
