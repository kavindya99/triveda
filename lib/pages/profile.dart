import 'dart:convert';

import 'package:ayu/pages/patient/Change_Password.dart';
import 'package:ayu/pages/patient/edit_profile.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// To parse this JSON data, do
//
//     final testModel = testModelFromMap(jsonString);

import 'dart:convert';

import '../styles/urlForAPI.dart';

List<TestModel> testModelFromMap(String str) =>
    List<TestModel>.from(json.decode(str).map((x) => TestModel.fromMap(x)));

String testModelToMap(List<TestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TestModel {
  TestModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory TestModel.fromMap(Map<String, dynamic> json) => TestModel(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}

// To parse this JSON data, do
//
//     final profileModel = profileModelFromMap(jsonString);

ProfileModel profileModelFromMap(String str) =>
    ProfileModel.fromMap(json.decode(str));

String profileModelToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
  ProfileModel({
    this.id,
    this.nic,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.dob,
    this.role,
    this.vaccinationData,
  });

  String id;
  String nic;
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  int gender;
  String dob;
  String role;
  List<VaccinationDatum> vaccinationData;

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        id: json["id"] == null ? null : json["id"],
        nic: json["nic"] == null ? null : json["nic"],
        username: json["username"] == null ? null : json["username"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        gender: json["gender"] == null ? null : json["gender"],
        dob: json["dob"] == null ? null : json["dob"],
        role: json["role"] == null ? null : json["role"],
        vaccinationData: json["vaccinationData"] == null
            ? null
            : List<VaccinationDatum>.from(json["vaccinationData"]
                .map((x) => VaccinationDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "nic": nic == null ? null : nic,
        "username": username == null ? null : username,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "gender": gender == null ? null : gender,
        "dob": dob == null ? null : dob,
        "role": role == null ? null : role,
        "vaccinationData": vaccinationData == null
            ? null
            : List<dynamic>.from(vaccinationData.map((x) => x.toMap())),
      };
}

class VaccinationDatum {
  VaccinationDatum({
    this.vCenter,
    this.vaccineType,
    this.batchNumber,
    this.vaccinatedAt,
    this.vaccinatedBy,
  });

  String vCenter;
  String vaccineType;
  String batchNumber;
  String vaccinatedAt;
  String vaccinatedBy;

  factory VaccinationDatum.fromMap(Map<String, dynamic> json) =>
      VaccinationDatum(
        vCenter: json["vCenter"] == null ? null : json["vCenter"],
        vaccineType: json["vaccineType"] == null ? null : json["vaccineType"],
        batchNumber: json["batchNumber"] == null ? null : json["batchNumber"],
        vaccinatedAt:
            json["vaccinatedAt"] == null ? null : json["vaccinatedAt"],
        vaccinatedBy:
            json["vaccinatedBy"] == null ? null : json["vaccinatedBy"],
      );

  Map<String, dynamic> toMap() => {
        "vCenter": vCenter == null ? null : vCenter,
        "vaccineType": vaccineType == null ? null : vaccineType,
        "batchNumber": batchNumber == null ? null : batchNumber,
        "vaccinatedAt": vaccinatedAt == null ? null : vaccinatedAt,
        "vaccinatedBy": vaccinatedBy == null ? null : vaccinatedBy,
      };
}

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map userData;

  var email;
  var firstName;
  var lastName;
  var gender;
  var name;
  var doctor_Id;
  var specialization;
  var contact_no;
  var hospital;
  var password;
  var lane;
  var province;
  var district;
  var available_time_from;
  var available_time_to;
  var service_type;
  var status;
  var address;

  Future getDataFromApi() async {
    http.Response response;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIyODgzYzU3OS0wYjUzLTRhN2MtOWY5MC1lNDBiMDQ4OTk5MWEiLCJ1bmlxdWVfbmFtZSI6InNhbmphbmEiLCJlbWFpbCI6ImJpdGl3bzc4NDJAeWtzMjQ3LmNvbSIsImp0aSI6IjY0YzFmYTI1LWZkZjAtNDk2OC05ZjBhLTI1ZmNlNGFiOTEzMiIsImV4cCI6MTY1MTgxNzk1NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.RjzrNhcMQOzcgfsktb0D9cXkQbIkZ4lT-Nx8wS_9fkE";
    var url = Uri.parse(profileUrl);

    print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      userData = json.decode(response.body);
      print("hi");
      print(userData);
      email = userData['email'];
      contact_no = userData['phoneNumber'];
      doctor_Id = userData['nic'];
      firstName = userData['firstName'];
      lastName = userData['lastName'];
      gender = userData['gender'];
      hospital = userData['dob'];
      province = userData['dob'];
      district = userData['dob'];
      available_time_from = userData['dob'];
      available_time_to = userData['dob'];
      service_type = userData['dob'];
      address = userData['dob'];
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
                        future: getDataFromApi(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    'Hi ' + firstName.toString() + ' ,',
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
                                    'Hi',
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
                              CircleAvatar(
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
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          profileTextMain('Name'),
                                          profileTextSub(
                                              firstName + " " + lastName),
                                        ],
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
                                          profileTextSub(contact_no),
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
                    return Center(child: Text("Loading"));
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
