import 'dart:convert';

import 'package:ayu/pages/doctor/wallet/wallet.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../styles/customDialogBox.dart';
import '../../../styles/urlForAPI.dart';
import 'Edit_details.dart';
import 'add_details.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  Map userData;

  var id;
  var accountName;
  var accountNo;
  var branch;
  var bankName;

  var res;

  Future getDataFromApi() async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'api/DoctorPayments/view-payment-details');

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

    res = response.statusCode;

    print(response.statusCode);
    if (response.statusCode == 200) {
      userData = json.decode(response.body);
      //print("response body :" + json.decode(response.body));
      //print("hi");
      print(userData);
      accountName = userData['accountName'];
      accountNo = userData['accountNo'];
      bankName = userData['bankName'];
      branch = userData['branch'];
      print(userData['doctorId']);

      if (accountName == null ||
          accountNo == null ||
          bankName == null ||
          branch == null) {
        print("no data to show");
      }

      if (userData.isNotEmpty) {
        print("here the data");
      }

      return userData;
    } else {
      return "true";
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Bank Details";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add';
    final callFunction = Wallet();
    final topPadding = 20.0;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You can edit your bank details which displayed here if any you have any modifications. ',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 17.0,
                ),
              ),
              Container(
                decoration: inputFieldDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: getDataFromApi(),
                        builder: (context, snapshot) {
                          if (res != 404) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Name : ',
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                accountName,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBetweenInputFields,
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Account Number : ',
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                accountNo,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBetweenInputFields,
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Branch : ',
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                branch,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBetweenInputFields,
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Bank : ',
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                bankName,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceBetweenInputFields,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: inputFieldDecoration,
                                        child: IconButton(
                                          onPressed: () {
                                            // pickIMage();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditBankDetails()),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.edit_outlined,
                                            size: 30,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Center(child: Text("Loading"));
                            }
                          } else {
                            return Center(
                              child: buttonInPages('Add Bank Details', context,
                                  AddBankDetails(), 0.0),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
