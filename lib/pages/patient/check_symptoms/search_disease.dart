import 'package:ayu/pages/patient/check_symptoms/search_result.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class SearchDisease extends StatefulWidget {
  const SearchDisease({Key key}) : super(key: key);

  @override
  _SearchDiseaseState createState() => _SearchDiseaseState();
}

class _SearchDiseaseState extends State<SearchDisease> {
  String dropdownValue1 = 'Symptom 1';
  String dropdownValue2 = 'Symptom 2';
  String dropdownValue3 = 'Symptom 3';
  String dropdownValue4 = 'Symptom 4';
  String dropdownValue5 = 'Symptom 5';

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Search Disease";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Search';
    final callFunction = SearchResult();
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
                      items: <String>['Symptom 1', 'Two', 'Free', 'Four']
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
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: secondaryColorOne,
                        fontSize: 16.0,
                      ),
                      isExpanded: true,
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue2 = newValue;
                        });
                      },
                      items: <String>['Symptom 2', 'Video']
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
                      items: <String>['Symptom 3', 'Two', 'Free', 'Four']
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
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: secondaryColorOne,
                        fontSize: 16.0,
                      ),
                      isExpanded: true,
                      value: dropdownValue4,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue4 = newValue;
                        });
                      },
                      items: <String>['Symptom 4', 'Two', 'Free', 'Four']
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
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: secondaryColorOne,
                        fontSize: 16.0,
                      ),
                      isExpanded: true,
                      value: dropdownValue5,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue5 = newValue;
                        });
                      },
                      items: <String>['Symptom 5', 'Two', 'Free', 'Four']
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
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
