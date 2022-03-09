import 'package:ayu/pages/patient/yoga/doctor_list.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';

import '../../payment.dart';

class OnlineYogaClass extends StatefulWidget {
  const OnlineYogaClass({Key key}) : super(key: key);

  @override
  _OnlineYogaClassState createState() => _OnlineYogaClassState();
}

class _OnlineYogaClassState extends State<OnlineYogaClass> {
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2022);
  final lastDate = DateTime(2030);

  String dropdownValue1 = 'Doctor';
  String dropdownValue3 = 'Time Slot';
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Online Yoga Class";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Create';
    final callFunction = Payment();
    final topPadding = 20.0;

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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/sub-back.png"),
                  fit: BoxFit.contain),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: secondaryColorOne,
                        fontSize: 16.0,
                      ),
                      isExpanded: true,
                      value: dropdownValue1,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue1 = newValue;
                        });
                      },
                      items: <String>['Doctor', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: whiteColor),
                    onPressed: () => _openDatePicker(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Row(
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                                color: secondaryColorOne,
                                fontSize: 16.0,
                                // shadows: [
                                //   letterShadow,
                                // ],
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: secondaryColorOne,
                        fontSize: 16.0,
                      ),
                      isExpanded: true,
                      value: dropdownValue3,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue3 = newValue;
                        });
                      },
                      items: <String>['Time Slot', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                inputFields('Fee'),
                spaceBetweenInputFields,
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _openDatePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor, // header background color
                onPrimary: whiteColor, // header text color
                onSurface: primaryColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: primaryColor, // button text color
                ),
              ),
            ),
            child: child ?? Text(""),
          );
        });
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
