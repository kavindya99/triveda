import 'dart:convert';
import 'dart:io';

import 'package:ayu/pages/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/appBar.dart';
import '../../styles/customDialogBox.dart';
import '../../styles/navigationDrawerDoctor.dart';
import '../../styles/urlForAPI.dart';
import '../../styles/variables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../lists_for.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File image;

  Future pickIMage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  bool onlineChannel = false;
  bool physicalChannel = false;
  bool onlineYoga = false;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _doctorId = TextEditingController();
  TextEditingController _position = TextEditingController();
  TextEditingController _hospital = TextEditingController();
  TextEditingController _lane = TextEditingController();
  String district = 'Colombo';
  String province = 'Central Province';

  List services = [];

  String availableTimeFrom = '8 AM';
  String availableTimeTo = '8 AM';

  var onlineChanneling;
  var physicalChanneling;
  var onlineYogaClass;

  int _genderRadioBtnVal;
  void _handleGenderChange(int value) {
    setState(() {
      _genderRadioBtnVal = value;
      print(_genderRadioBtnVal);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  updateProfile(BuildContext context) async {
    var url = Uri.parse(baseUrl + '/auth/doctor-profile-edit');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    Map<String, dynamic> data = {
      "name": _name.text,
      "email": _email.text,
      "phoneNumber": _phone.text,
      "gender": _genderRadioBtnVal,
      "medicalCouncilRegID": _doctorId.text,
      "specialization": _position.text,
      "hospital": _hospital.text,
      "lane": _lane.text,
      "province": province,
      "district": district,
      "availableTimeFrom": availableTimeFrom,
      "availableTimeTo": availableTimeTo,
      "serviceType": services.toString(),
    };
    var body = json.encode(data);
    print(url);
    print(data);
    var jsonResponse;
    try {
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print(res.statusCode);

      if (res.statusCode == 400) {
        print(json.decode(res.body));
      }
      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Success",
            description: "Successfully updated the profile",
          ),
        );
        Navigator.of(this.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => DoctorProfile(),
            ),
            (Route<dynamic> route) => false);
        _name.clear();
        _email.clear();
        // _currentPassword.clear();
        print("Response Status: ${res.statusCode}");

        if (jsonResponse != null) {}
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return primaryColor;
      }
      return secondaryColorOne;
    }

    if (onlineChannel == true) {
      onlineChanneling = "Online Consultation";
    } else {
      onlineChanneling = null;
    }

    if (physicalChannel == true) {
      physicalChanneling = "Physical Channeling";
    } else {
      physicalChanneling = null;
    }

    if (onlineYoga == true) {
      onlineYogaClass = "Online Yoga Class";
    } else {
      onlineYogaClass = null;
      //services.remove(onlineYogaClass);
    }
    services = [onlineChanneling, physicalChanneling, onlineYogaClass];

    if (onlineYoga == false &&
        physicalChannel == false &&
        onlineChannel == false) {
      services = [];
    }
    print(services);

    final pageTitle = "Update Profile";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update Profile';
    final callFunction = DoctorProfile();
    final topPadding = 25.0;

    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Enter new values to the fields which you need to update in your profile details',
                    style: TextStyle(color: primaryColor, fontSize: 17.0),
                  ),
                  spaceBetweenInputFields,
                  inputFieldsReg('Name', _name, "Name can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg(
                      'Email', _email, "Email can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg(
                      'Contact No', _phone, "Contact No can't be empty", false),
                  spaceBetweenInputFields,
                  Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _genderRadioBtnVal,
                        activeColor: primaryColor,
                        onChanged: _handleGenderChange,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                          color: secondaryColorOne,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                      ),
                      Radio(
                        value: 1,
                        groupValue: _genderRadioBtnVal,
                        activeColor: primaryColor,
                        onChanged: _handleGenderChange,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                          color: secondaryColorOne,
                        ),
                      ),
                    ],
                  ),
                  spaceBetweenInputFields,
                  inputFieldsReg('Doctor ID', _doctorId,
                      "Doctor ID can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg('Specialization', _position,
                      "Specialization can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg(
                      'Hospital', _hospital, "Hospital can't be empty", false),
                  spaceBetweenInputFields,
                  Row(
                    children: [
                      Text(
                        "Personal Address",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  spaceBetweenInputFields,
                  inputFieldsReg('Lane', _lane, "Lane can't be empty", false),
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
                  spaceBetweenInputFields,
                  //dropDownItems(province, setState, provinces),
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
                        value: province,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            province = newValue;
                          });
                        },
                        items: provinces
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
                  Row(
                    children: [
                      Text(
                        "Available Time",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
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
                        value: availableTimeFrom,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            availableTimeFrom = newValue;
                          });
                        },
                        items: availableTime
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
                        value: availableTimeTo,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            availableTimeTo = newValue;
                          });
                        },
                        items: availableTime
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
                  Row(
                    children: [
                      Text(
                        "Service Types",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  spaceBetweenInputFields,
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: onlineChannel,
                        onChanged: (bool value) {
                          setState(() {
                            onlineChannel = value;
                          });
                        },
                      ),
                      Text(
                        "Online Consulting",
                        style:
                            TextStyle(color: secondaryColorOne, fontSize: 15.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: physicalChannel,
                        onChanged: (bool value) {
                          setState(() {
                            physicalChannel = value;
                          });
                        },
                      ),
                      Text(
                        "Physical Channeling",
                        style:
                            TextStyle(color: secondaryColorOne, fontSize: 15.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: onlineYoga,
                        onChanged: (bool value) {
                          setState(() {
                            onlineYoga = value;
                          });
                        },
                      ),
                      Text(
                        "Online Yoga",
                        style:
                            TextStyle(color: secondaryColorOne, fontSize: 15.0),
                      ),
                    ],
                  ),
                  spaceBetweenInputFields,
                  // MaterialButton(
                  //     child: Container(
                  //       decoration: inputFieldDecoration,
                  //       width: double.infinity,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(15.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               'Profile Picture',
                  //               style: TextStyle(
                  //                   color: secondaryColorOne,
                  //                   fontSize: 16.0,
                  //                   fontWeight: FontWeight.w400),
                  //             ),
                  //             Icon(
                  //               // <-- Icon
                  //               Icons.image,
                  //               size: 24.0,
                  //               color: secondaryColorTwo,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       pickIMage();
                  //     }),
                  // spaceBetweenInputFields,
                  // AspectRatio(
                  //   aspectRatio: 448 / 451,
                  //   child: Container(
                  //     child: image != null
                  //         ? Image.file(
                  //             image,
                  //             fit: BoxFit.fitWidth,
                  //             alignment: FractionalOffset.center,
                  //           )
                  //         : Text(''),
                  //   ),
                  // ),
                  //buttonInPages(buttonText, context, callFunction, topPadding),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: topPadding),
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: secondaryColorOne),
                      onPressed: () {
                        updateProfile(context);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
