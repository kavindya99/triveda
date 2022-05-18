import 'dart:convert';

import 'package:ayu/pages/payment.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../styles/urlForAPI.dart';
import '../../../pages/lists_for.dart';

class ChannelingDoctor extends StatefulWidget {
  const ChannelingDoctor({Key key}) : super(key: key);

  @override
  _ChannelingDoctorState createState() => _ChannelingDoctorState();
}

class _ChannelingDoctorState extends State<ChannelingDoctor> {
  String district = 'Colombo';
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(DateTime.now().year - 5);
  final lastDate = DateTime(DateTime.now().year + 5);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime date;
  var displayDate;

  // ignore: missing_return
  String getText() {
    if (date == null) {
      return selectedDate.toString().split(' ')[0];
    } else {
      displayDate = date.toString();
    }
  }

  String dropdownValue1;
  String dropdownValue2 = 'District';
  String dropdownValue3 = 'Time Slot';

  Future apiCall(
      String district, String date, String time, String doctor) async {
    http.Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    var url = Uri.parse("${baseUrl + '/appointment'}");

    print(token);
    print(url);
    response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response);

    return response.body;
  }

  var userData;
  var dataFromResponse;

  List<String> doctorList = [];
  List<String> doctorsNameList = [];

  Future<String> getDataFromApi() async {
    http.Response response;
    var url = Uri.parse(baseUrl + "user/doctors-physical-consult");

    //print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    //print(response.body);

    if (response.body != null) {
      //print(json.decode(response.body));
      var jsonData = json.decode(response.body);
      //print(jsonData[1]['name']);
      dataFromResponse = jsonData;

      for (var doctor in dataFromResponse) {
        doctorsNameList.add(doctor['name']);
        print(doctor['name']);
      }

      return userData;
    } else {
      return "true";
    }
  }

  List<String> doctorNamesDropDown() {
    getDataFromApi();
    return doctorsNameList;
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Doctor Channeling";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Book';
    final callFunction = Payment();
    final topPadding = 20.0;

    List<String> doctorNamesOf = doctorNamesDropDown();

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
            alignment: Alignment.center,
            child: Column(
              children: [
                spaceBetweenInputFields,
                Text(
                  'You can book an appointment for a doctor, to get consultation physically ',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                            value: district,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            underline: SizedBox(),
                            onChanged: (String newValue) {
                              setState(() {
                                district = newValue;
                              });
                            },
                            items: districts
                                .map<DropdownMenuItem<String>>((String value1) {
                              return DropdownMenuItem<String>(
                                value: value1,
                                child: Text(value1),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                // FutureBuilder(
                //     future: getDataFromApi(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.done) {
                //         return Column(
                //           children: [
                //             Container(
                //               decoration: inputFieldDecoration,
                //               child: Padding(
                //                 padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                //                 child: DropdownButton<String>(
                //                   style: TextStyle(
                //                     color: secondaryColorOne,
                //                     fontSize: 16.0,
                //                   ),
                //                   isExpanded: true,
                //                   value: doctors.first,
                //                   icon: const Icon(Icons.arrow_drop_down),
                //                   elevation: 16,
                //                   underline: SizedBox(),
                //                   onChanged: (String newValue) {
                //                     setState(
                //                       () {
                //                         doctors.first = newValue;
                //                       },
                //                     );
                //                   },
                //                   items: doctors.map<DropdownMenuItem<String>>(
                //                       (String value) {
                //                     return DropdownMenuItem<String>(
                //                       value: value,
                //                       child: Text(value),
                //                     );
                //                   }).toList(),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         );
                //       }
                //       return Center(
                //         child: Text(
                //           "Patiently wait until the Names are Loading",
                //           style: TextStyle(
                //             color: primaryColor,
                //           ),
                //         ),
                //       );
                //     }),
                Column(
                  children: [
                    Container(
                      decoration: inputFieldDecoration,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: DropdownButton<String>(
                          style: TextStyle(
                            color: secondaryColorOne,
                            fontSize: 16.0,
                          ),
                          hint: Text('Select a Doctor'),
                          isExpanded: true,
                          value: dropdownValue1,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          underline: SizedBox(),
                          onChanged: (String newValue) {
                            setState(
                              () {
                                dropdownValue1 = newValue;
                                getDataFromApi();
                                print(dropdownValue1);
                              },
                            );
                          },
                          // items: doctors
                          //     .map<DropdownMenuItem<String>>((String value) {
                          //   return DropdownMenuItem<String>(
                          //     value: value,
                          //     child: new Text(value),
                          //   );
                          // }).toList(),
                          items: doctorNamesOf
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
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
                            getText(),
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
                buttonInPages(
                    buttonText,
                    context,
                    apiCall(
                        district, displayDate, dropdownValue1, dropdownValue3),
                    topPadding),
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
            child: child ?? Text("selectedDate"),
          );
        });
    if (date != null) {
      setState(() {
        selectedDate = date;
        print(selectedDate);
      });
    }
  }
}
