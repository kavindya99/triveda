import 'dart:convert';

import 'package:ayu/pages/profile.dart';
import 'package:ayu/styles/urlForAPI.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/doctor_profile.dart';
import 'package:http/http.dart' as http;

import 'customDialogBox.dart';

Map userData;

var name;
var nameFLetter;
var nameLLetter;

Future getDataFromApi() async {
  http.Response response;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = (prefs.getString('token') ?? '');
  // String token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
  var url = Uri.parse(baseUrl + 'user/profile-patient');

  print(token);
  response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 405) {}

  print(response.statusCode);
  if (response.statusCode == 200) {
    userData = json.decode(response.body);
    //print("response body :" + json.decode(response.body));
    //print("hi");
    print(userData);
    name = userData['name'];
    if (userData['name'].split(' ').length > 1) {
      nameFLetter = userData['name'].split(' ')[0][0].toString().toUpperCase();
      nameLLetter = name.split(' ')[1][0].toString().toUpperCase();
    } else {
      nameFLetter = name[0].toString().toUpperCase();
      nameLLetter = name[0].toString().toUpperCase();
    }

    return userData;
  } else {
    return "true";
  }
}

PreferredSize appBarComponent(
        pageTitle, appBarBg, textColor, iconColor, backgroundColor, context) =>
    PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              // onPressed: () {
              //   MaterialPageRoute(
              //     builder: (context) => const Profile(),
              //   );
              // },
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Column(
                children: [
                  FutureBuilder(
                      future: getDataFromApi(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done)
                          return Column(
                            children: [
                              SizedBox(
                                child: Stack(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.all(15), //You can use Edge
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: secondaryColorTwo,
                                      ),
                                      child: Text(
                                        nameFLetter + nameLLetter,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            color: whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        return Column(
                          children: [
                            SizedBox(
                              child: Stack(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.all(15), //You can use Edge
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: secondaryColorTwo,
                                    ),
                                    child: Text(
                                      'UU',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.transparent),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(appBarBg), fit: BoxFit.fill),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      pageTitle,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

Map userDataDoctor;

var nameDoctor;
var nameFLetterDoctor;
var nameLLetterDoctor;

Future getDataFromApiForDoctor() async {
  http.Response response;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = (prefs.getString('token') ?? '');
  // String token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
  var url = Uri.parse(baseUrl + 'user/profile-doctor');

  print(token);
  response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 405) {}

  print(response.statusCode);
  if (response.statusCode == 200) {
    userDataDoctor = json.decode(response.body);
    //print("response body :" + json.decode(response.body));
    //print("hi");
    print(userDataDoctor);
    nameDoctor = userDataDoctor['name'];
    if (userDataDoctor['name'].split(' ').length > 1) {
      nameFLetterDoctor =
          userDataDoctor['name'].split(' ')[0][0].toString().toUpperCase();
      nameLLetterDoctor = nameDoctor.split(' ')[1][0].toString().toUpperCase();
    } else {
      nameFLetterDoctor = nameDoctor[0].toString().toUpperCase();
      nameLLetterDoctor = nameDoctor[0].toString().toUpperCase();
    }

    return userDataDoctor;
  } else {
    return "true";
  }
}

PreferredSize appBarDoctorComponent(
        pageTitle, appBarBg, textColor, iconColor, backgroundColor, context) =>
    PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              // onPressed: () {
              //   MaterialPageRoute(
              //     builder: (context) => const Profile(),
              //   );
              // },
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DoctorProfile()));
              },
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(100.0),
              //   child: Image.asset(
              //     'images/mee.jpg',
              //     fit: BoxFit.contain,
              //     height: 40.0,
              //     width: 40.0,
              //   ),
              // ),
              child: Column(
                children: [
                  FutureBuilder(
                      future: getDataFromApiForDoctor(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done)
                          return Column(
                            children: [
                              SizedBox(
                                child: Stack(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.all(15), //You can use Edge
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: secondaryColorTwo,
                                      ),
                                      child: Text(
                                        nameFLetterDoctor + nameLLetterDoctor,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            color: whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        return Column(
                          children: [
                            SizedBox(
                              child: Stack(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.all(15), //You can use Edge
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: secondaryColorTwo,
                                    ),
                                    child: Text(
                                      'UU',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.transparent),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(appBarBg), fit: BoxFit.fill),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      pageTitle,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
