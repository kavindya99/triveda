import 'package:ayu/pages/patient/check_symptoms/search_result.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../styles/customDialogBox.dart';
import '../../../styles/urlForAPI.dart';
import 'SymptomList.dart';

class SearchDisease extends StatefulWidget {
  const SearchDisease({Key key}) : super(key: key);

  @override
  _SearchDiseaseState createState() => _SearchDiseaseState();
}

class _SearchDiseaseState extends State<SearchDisease> {
  String dropdownValue1 = "Itching";
  String dropdownValue2 = "Itching";
  String dropdownValue3 = "Itching";
  String dropdownValue4 = "Itching";
  String dropdownValue5 = "Itching";

  var predictedDisease;

  predictDisease(String symptom1, String symptom2, String symptom3,
      String symptom4, String symptom5) async {
    try {
      var url = Uri.parse(diseasePredictingUrl);

      Map<String, dynamic> data = {
        "data": [
          [
            dropdownValue1,
            dropdownValue2,
            dropdownValue3,
            dropdownValue4,
            dropdownValue5
          ]
        ]
      };

      var body = json.encode(data);
      // print(url);
      var res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      // print(res.body);
      // print(res.statusCode);
      var jsonResponse;

      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);
        predictedDisease = jsonResponse['data'][0]
            .split(',')[3]
            .split('}')[0]
            .split(':')[1]
            .split('\'')[1];
        print(predictedDisease);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Search Disease";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Search';
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
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("images/sub-back.png"),
            //       fit: BoxFit.contain),
            // ),
            alignment: Alignment.center,
            child: Column(
              children: [
                spaceBetweenInputFields,
                Text(
                  'You can input five symptoms by selecting from the dropdown lists and search your disease.',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
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
                      value: dropdownValue1,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue1 = newValue;
                        });
                      },
                      items: symptoms
                          .map<DropdownMenuItem<String>>((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
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
                      items: symptoms
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
                      items: symptoms
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
                      items: symptoms
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
                      items: symptoms
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
                  padding: EdgeInsets.symmetric(vertical: topPadding),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                    onPressed: () {
                      // predictDisease(dropdownValue1, dropdownValue2,
                      //     dropdownValue3, dropdownValue4, dropdownValue5);
                      showDialog(
                        context: this.context,
                        builder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder(
                                future: predictDisease(
                                    dropdownValue1,
                                    dropdownValue2,
                                    dropdownValue3,
                                    dropdownValue4,
                                    dropdownValue5),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return CustomDialog(
                                      title: "Predicted Disease",
                                      description: predictedDisease,
                                    );
                                  }
                                  return CustomDialog(
                                    title: "Predicted Disease",
                                    description: "Wait for the response",
                                  );
                                })
                          ],
                        ),
                      );
                      // Navigator.of(this.context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             SearchResult()),
                      //     (Route<dynamic> route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            shadows: [
                              letterShadow,
                            ],
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                // Column(
                //   children: [
                //     FutureBuilder(
                //         future: predictDisease(dropdownValue1, dropdownValue2,
                //             dropdownValue3, dropdownValue4, dropdownValue5),
                //         builder: (context, snapshot) {
                //           if (snapshot.connectionState ==
                //               ConnectionState.done) {
                //             return Text(predictedDisease);
                //           }
                //           return Text("oops");
                //         }),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
