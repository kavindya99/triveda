import 'dart:convert';

import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../styles/urlForAPI.dart';
import 'doctor/change_password.dart';
import 'doctor/edit_profile.dart';

class ViewDoctorProfile extends StatefulWidget {
  final String dataFromResponse;
  const ViewDoctorProfile(this.dataFromResponse, {Key key}) : super(key: key);

  @override
  _ViewDoctorProfileState createState() =>
      _ViewDoctorProfileState(dataFromResponse);
}

class _ViewDoctorProfileState extends State<ViewDoctorProfile> {
  final String dataFromResponse;

  var id;
  var name;
  var email;
  var phoneNumber;
  var gender;
  var genderType;
  var medicalCouncilRegId;
  var specialization;
  var hospital;
  var lane;
  var province;
  var district;
  var availableTimeFrom;
  var availableTimeTo;
  var serviceType;
  var status;
  var deleteStatus;
  var role;

  var responseData;
  var doctorData;
  var ifNoData = "Sorry, there is problem with data";

  _ViewDoctorProfileState(this.dataFromResponse);

  Future getDoctorProfile(String id) async {
    http.Response response;
    var url = Uri.parse(baseUrl + "user/doctors/" + dataFromResponse);

    //print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    print(response.statusCode);

    if (response.body != null) {
      print(json.decode(response.body));
      var jsonData = json.decode(response.body);
      //print(jsonData[1]['name']);
      responseData = jsonData;

      id = dataFromResponse;
      print(id);
      name = responseData['name'];
      email = responseData['email'];
      phoneNumber = responseData['phoneNumber'];
      genderType = responseData['gender'];
      if (genderType == 1) {
        gender = "Female";
      } else {
        gender = "Male";
      }
      medicalCouncilRegId = responseData['medicalCouncilRegID'];
      specialization = responseData['specialization'];
      hospital = responseData['hospital'];
      lane = responseData['lane'];
      province = responseData['province'];
      district = responseData['district'];
      availableTimeFrom = responseData['availableTimeFrom'];
      availableTimeTo = responseData['availableTimeTo'];
      serviceType = responseData['serviceType'];
      status = responseData['status'];
      deleteStatus = responseData['deleteStatus'];
      role = responseData['role'];
      return responseData;
    } else {
      return ifNoData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawerDoctor(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: whiteColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/profile-back.png'),
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
                        future: getDoctorProfile(id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    'Dr ' + name.split(" ")[0] + ",",
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
                                    '',
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
                    Column(
                      children: [
                        SizedBox(
                          child: Stack(
                            children: [
                              const CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage('images/mee.jpg'),
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
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          profileTextMain('Role'),
                          profileTextSub('Doctor'),
                        ],
                      ),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                profileTextMain('Personal'),
                FutureBuilder(
                    future: getDoctorProfile(id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Column(
                          children: [
                            Container(
                              decoration: inputFieldDecoration,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              profileTextMain('Name'),
                                              profileTextSub(name),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              profileTextMain('Gender'),
                                              profileTextSub(gender),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    spaceBetweenInputFields,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              profileTextMain('Email'),
                                              profileTextSub(email),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    spaceBetweenInputFields,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              profileTextMain('Address'),
                                              profileTextSub(lane +
                                                  " ," +
                                                  district +
                                                  " ," +
                                                  province),
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
                            profileTextMain('Professional'),
                            Container(
                              decoration: inputFieldDecoration,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              profileTextMain('Doctor ID'),
                                              profileTextSub(
                                                  medicalCouncilRegId),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              profileTextMain('Hospital'),
                                              profileTextSub(hospital),
                                            ],
                                          ),
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
                                            profileTextMain('Specialization'),
                                            profileTextSub(specialization),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Center(child: Text("Loading"));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
