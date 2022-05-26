import 'dart:convert';

import 'package:ayu/pages/doctor/prescription/edit_prescription.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:flutter/material.dart';

import '../../../styles/appBar.dart';
import '../../../styles/customDialogBox.dart';
import '../../../styles/urlForAPI.dart';
import '../../../styles/variables.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddedList extends StatefulWidget {
  const AddedList({Key key}) : super(key: key);

  @override
  _AddedListState createState() => _AddedListState();
}

class _AddedListState extends State<AddedList> {
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
    var url = Uri.parse(baseUrl + 'api/Prescriptions/doctor-view');

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              spaceBetweenInputFields,
              Text(
                'All the prescriptions you added are listed here. If you need any modifications, you can edit the prescription.',
                style: TextStyle(color: primaryColor, fontSize: 17.0),
              ),
              spaceBetweenInputFields,
              Column(
                children: [
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
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Container(
                                                child: Text(
                                                  'Patient Name : ',
                                                  textDirection:
                                                      TextDirection.ltr,
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      100.0, 0, 0, 20.0),
                                              child: Container(
                                                child: Text(
                                                  userData[i]['patientId'] ??
                                                      'Patient',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Color.fromRGBO(
                                                          95, 141, 136, 1),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Container(
                                                child: Text(
                                                  'Date : ',
                                                  textDirection:
                                                      TextDirection.ltr,
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
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
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Color.fromRGBO(
                                                          95, 141, 136, 1),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Container(
                                                child: Text(
                                                  'Medicine : ',
                                                  textDirection:
                                                      TextDirection.ltr,
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      95,
                                                                      141,
                                                                      136,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      95,
                                                                      141,
                                                                      136,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      95,
                                                                      141,
                                                                      136,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20.0, bottom: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    decoration:
                                                        inputFieldDecoration,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        // pickIMage();
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EditPrescription(
                                                                      userData[
                                                                              i]
                                                                          [
                                                                          'id'])),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.edit_outlined,
                                                        size: 20,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
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
                      return Center(child: Text("Loading"));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
