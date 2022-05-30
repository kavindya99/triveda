import 'dart:convert';

import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/customDialogBox.dart';
import '../../styles/urlForAPI.dart';

class Prescriptions extends StatefulWidget {
  const Prescriptions({Key key}) : super(key: key);

  @override
  _PrescriptionsState createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  var userData;

  var name;
  var date;
  var prescription;
  var lengthItems;
  var lengthMed;

  Future getDataFromApi() async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'api/Prescriptions/patient-view');

    print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 405) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "405",
              ));
    }

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      userData = json.decode(response.body);

      lengthItems = userData[0].length;

      return userData;
    } else {
      return "true";
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Prescriptions";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              spaceBetweenInputFields,
              FutureBuilder(
                future: getDataFromApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        for (int i = 0; i < userData.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              decoration: inputFieldDecoration,
                              child: ExpansionTile(
                                title: Text(
                                  'Prescription ' + (i + 1).toString(),
                                  style: TextStyle(
                                    color: secondaryColorOne,
                                  ),
                                ),
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            child: Text(
                                              'Doctor Name : ',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: primaryColor,
                                                // fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              100.0, 0, 0, 20.0),
                                          child: Container(
                                            child: Text(
                                              userData[i]['doctorName'] ??
                                                  'Doctor',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      95, 141, 136, 1),
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            child: Text(
                                              'Date : ',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Color.fromRGBO(
                                                    95, 141, 136, 1),
                                                // fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              100.0, 0, 0, 20.0),
                                          child: Container(
                                            child: Text(
                                              userData[i]['date']
                                                      .split('T')[0] ??
                                                  'No Date Found',
                                              // userData[i]['prescription']
                                              //         .split(',')[0]
                                              //         .split(':')[0]
                                              //         .toString() ??
                                              //     'null',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      95, 141, 136, 1),
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            child: Text(
                                              'Medicine : ',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: primaryColor,
                                                // fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        // for (int m = 0;
                                        //     i <
                                        //         userData[i]['prescription']
                                        //             .length;
                                        //     m++)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 100.0),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                // for (var med in userData[i]
                                                //         ['prescription']
                                                //     .split(',')
                                                //     .length)
                                                Column(
                                                  children: [
                                                    Text(
                                                      userData[i]['prescription']
                                                              .split(',')[0]
                                                              .toString() ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Color.fromRGBO(
                                                              95, 141, 136, 1),
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 100.0),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                // for (var med in userData[i]
                                                //         ['prescription']
                                                //     .split(',')
                                                //     .length)
                                                Column(
                                                  children: [
                                                    Text(
                                                      userData[i]['prescription']
                                                              .split(',')[1]
                                                              .toString() ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Color.fromRGBO(
                                                              95, 141, 136, 1),
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 100.0),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                // for (var med in userData[i]
                                                //         ['prescription']
                                                //     .split(',')
                                                //     .length)
                                                Column(
                                                  children: [
                                                    Text(
                                                      userData[i]['prescription']
                                                              .split(',')[2]
                                                              .toString() ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Color.fromRGBO(
                                                              95, 141, 136, 1),
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Padding(
                                        //   padding:
                                        //       const EdgeInsets.fromLTRB(
                                        //           20.0, 0, 20.0, 10.0),
                                        //   child: DataTable(
                                        //     columns: [
                                        //       DataColumn(
                                        //         label: Text(
                                        //           'Name',
                                        //           style: TextStyle(
                                        //             color: primaryColor,
                                        //             fontWeight:
                                        //                 FontWeight.w700,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       DataColumn(
                                        //         label: Text(
                                        //           'Amount',
                                        //           style: TextStyle(
                                        //             color: primaryColor,
                                        //             fontWeight:
                                        //                 FontWeight.w700,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //     rows: [
                                        //       DataRow(
                                        //         cells: [
                                        //           // for (int m = 0;
                                        //           //     i <
                                        //           //         userData[i][
                                        //           //                 'prescription']
                                        //           //             .split(',')
                                        //           //             .length;
                                        //           //     m++)
                                        //           DataCell(
                                        //             Text(
                                        //               'userData',
                                        //               style: TextStyle(
                                        //                   color:
                                        //                       primaryColor),
                                        //             ),
                                        //           ),
                                        //           DataCell(
                                        //             Text(
                                        //               '2nd one',
                                        //               style: TextStyle(
                                        //                   color:
                                        //                       primaryColor),
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       // DataRow(
                                        //       //   cells: [
                                        //       //     DataCell(
                                        //       //       Text(
                                        //       //         'Paanthi',
                                        //       //         style: TextStyle(
                                        //       //             color:
                                        //       //                 primaryColor),
                                        //       //       ),
                                        //       //     ),
                                        //       //     DataCell(
                                        //       //       Text(
                                        //       //         '50',
                                        //       //         style: TextStyle(
                                        //       //             color:
                                        //       //                 primaryColor),
                                        //       //       ),
                                        //       //     ),
                                        //       //   ],
                                        //       // ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                    // return Text("this is the email\n\n" + email);
                  }
                  return Center(
                      child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/waiting.webp'),
                      ),
                      Text("Patiently wait until the data is Loading.."),
                    ],
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
