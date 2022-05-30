import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../styles/urlForAPI.dart';

import '../view_doctor_profile_patient.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key key}) : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  var userData;
  var dataFromResponse;

  Future getDataFromApi() async {
    http.Response response;
    var url = Uri.parse(baseUrl + "user/doctors-online-consulting");

    //print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    print(response.statusCode);

    if (response.body != null) {
      //print(json.decode(response.body));
      var jsonData = json.decode(response.body);
      //print(jsonData[1]['name']);
      dataFromResponse = jsonData;
      var name;
      for (int i = 0; i < jsonData.length; i++) {
        name = jsonData[i]['name'];
        //print(name);
      }
      return userData;
    } else {
      return "true";
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Doctor List";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = "Doctor's Name";
    //final callFunction = ViewDoctorProfilePatient();
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
                  'Click on doctor’s name to book an appointment for online consultation and also you can get their details',
                  style: TextStyle(fontSize: 16.00, color: primaryColor),
                ),
                spaceBetweenInputFields,
                inputFields('Search'),
                spaceBetweenInputFields,
                FutureBuilder(
                    future: getDataFromApi(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (dataFromResponse.length != 0)
                          return Column(
                            children: [
                              //for(var u in userData)
                              for (int i = 0; i < dataFromResponse.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: listView(
                                      dataFromResponse[i]['name'],
                                      context,
                                      ViewDoctorProfilePatient(
                                          dataFromResponse[i]['id']),
                                      topPadding),
                                ),
                            ],
                          );
                        else {
                          return Center(
                            child: Text(
                              "Sorry, No doctors Available at this moment",
                              style:
                                  TextStyle(color: errorColor, fontSize: 17.0),
                            ),
                          );
                        }
                      }
                      return Center(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('images/waiting.webp'),
                            ),
                            Text(
                              "Patiently wait until the Names are Loading",
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
