import 'dart:convert';

import 'package:ayu/pages/patient/Change_Password.dart';
import 'package:ayu/pages/patient/edit_profile.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/customDialogBox.dart';
import '../styles/urlForAPI.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map userData;

  var id;
  var name;
  var email;
  var phoneNumber;
  var province;
  var district;
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

    if (response.statusCode == 405) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "405",
              ));
    }

    print(response.statusCode);
    if (response.statusCode == 200) {
      userData = json.decode(response.body);
      //print("response body :" + json.decode(response.body));
      //print("hi");
      print(userData);
      email = userData['email'];
      phoneNumber = userData['phoneNumber'];
      name = userData['name'];
      province = userData['province'];
      district = userData['district'];
      if (userData['name'].split(' ').length > 1) {
        nameFLetter =
            userData['name'].split(' ')[0][0].toString().toUpperCase();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: whiteColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/profile-back.webp'),
                  fit: BoxFit.fill),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: getDataFromApi(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    //'Hi ' + firstName.toString() + ' ,',
                                    'Hi ' + name.split(" ")[0] + " ," ?? 'user',
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    'Hi user',
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
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
                                        padding: EdgeInsets.all(
                                            25), //You can use Edge
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: secondaryColorTwo,
                                        ),
                                        child: Text(
                                          nameFLetter + nameLLetter,
                                          style: TextStyle(
                                              fontSize: 80.0,
                                              fontWeight: FontWeight.w600,
                                              color: whiteColor),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -10.0,
                                        child: Container(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.camera_alt_rounded,
                                              size: 35,
                                              color: secondaryColorThree,
                                            ),
                                          ),
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
                                          EdgeInsets.all(25), //You can use Edge
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: secondaryColorTwo,
                                      ),
                                      child: Text(
                                        'UU',
                                        style: TextStyle(
                                            fontSize: 80.0,
                                            fontWeight: FontWeight.w600,
                                            color: whiteColor),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -10.0,
                                      child: Container(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.camera_alt_rounded,
                                            size: 35,
                                            color: secondaryColorThree,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   margin: EdgeInsets.only(bottom: 20.0),
                              //   padding: EdgeInsets.all(25), //You can use Edge
                              //   decoration: BoxDecoration(
                              //     shape: BoxShape.circle,
                              //     color: secondaryColorTwo,
                              //   ),
                              //   child: Text(
                              //     name.split(' ')[0][0] +
                              //             name.split(' ')[0][0] ??
                              //         ' ',
                              //     style: TextStyle(
                              //         fontSize: 80.0,
                              //         fontWeight: FontWeight.w600,
                              //         color: whiteColor),
                              //   ),
                              // ),
                            ],
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: getDataFromApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    profileTextMain('Role'),
                                    profileTextSub('Patient'),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: inputFieldDecoration,
                                child: IconButton(
                                  onPressed: () {
                                    // pickIMage();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile()),
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
                          spaceBetweenInputFields,
                          profileTextMain('Info'),
                          Container(
                            decoration: inputFieldDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            profileTextMain('Name'),
                                            profileTextSub(name),
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
                                            profileTextMain('District'),
                                            profileTextSub(district),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            profileTextMain('Province'),
                                            profileTextSub(province),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceBetweenInputFields,
                          profileTextMain('Contact Info'),
                          Container(
                            decoration: inputFieldDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          profileTextMain('Contact No'),
                                          profileTextSub(phoneNumber),
                                        ],
                                      ),
                                    ],
                                  ),
                                  spaceBetweenInputFields,
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          profileTextMain('Email'),
                                          profileTextSub(email),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangePassword()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.vpn_key,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
