import 'dart:convert';

import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/customDialogBox.dart';
import '../styles/urlForAPI.dart';
import 'lists_for.dart';
import 'package:http/http.dart' as http;

class SignUpDoctor extends StatefulWidget {
  const SignUpDoctor({Key key}) : super(key: key);

  @override
  _SignUpDoctorState createState() => _SignUpDoctorState();
}

class _SignUpDoctorState extends State<SignUpDoctor> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _doctorId = TextEditingController();
  TextEditingController _position = TextEditingController();
  TextEditingController _hospital = TextEditingController();
  TextEditingController _lane = TextEditingController();

  Map userDetails;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var res;
  var getRes;

  registerUser(
      String name,
      String email,
      String phoneNumber,
      String password,
      String district,
      String province,
      int gender,
      String doctorId,
      String specialization,
      String hospital,
      String lane,
      String availableTimeFrom,
      String availableTimeTo,
      String service) async {
    print("re occurring");
    var url = Uri.parse(baseUrl + 'auth/doctor-register');
    print(url);
    print(name);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "medicalCouncilRegID": doctorId,
      "specialization": specialization,
      "password": password,
      "hospital": hospital,
      "lane": lane,
      "province": province,
      "district": district,
      "availableTimeFrom": availableTimeFrom,
      "availableTimeTo": availableTimeTo,
      "serviceType": service,
    };
    print(data);
    var body = json.encode(data);
    print(name);

    try {
      res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: body);
      print(res.statusCode);

      if (res.statusCode == 404) {
        print(res.statusCode);
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Error",
                  description: "Something went wrong",
                  img: 'images/error.webp',
                ));
      }

      if (res.statusCode == 400) {
        print(res.statusCode);
        if (!_email.text.contains(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")) {
          showDialog(
              context: this.context,
              builder: (context) => CustomDialog(
                    title: "Error",
                    description:
                        "Please enter your email address with the correct format",
                    img: 'images/error.webp',
                  ));
        } else if (_password.text.length < 10 || _password.text.length > 10) {
          print(res.statusCode);
          showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
              title: "Error",
              description: "Your contact number is less than 10 numbers",
              img: 'images/error.webp',
            ),
          );
        } else if (!_password.text.contains(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$') &&
            _password.text.length >= 8) {
          print(res.statusCode);
          showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
              title: "Error",
              description:
                  "Your password should contain at least one special character, one numeric number, one uppercase and one lowercase",
              img: 'images/error.webp',
            ),
          );
        } else if (_password.text.contains(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$') &&
            _password.text.length < 8) {
          print(res.statusCode);
          showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
              title: "Error",
              description: "Your password length is less than 8 characters",
              img: 'images/error.webp',
            ),
          );
        } else if (!_password.text.contains(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$') &&
            _password.text.length < 8) {
          print(res.statusCode);
          showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
              title: "Error",
              description: "Your password is not in the correct format",
              img: 'images/error.webp',
            ),
          );
        } else {
          showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
              title: "Error",
              description: "Please enter the values in the correct format.",
              img: 'images/error.webp',
            ),
          );
        }
      }

      if (res.statusCode == 200) {
        var jsonResponse = json.decode(res.body);
        print(jsonResponse);
        print("Response Status: ${res.statusCode}");
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Success",
            description: "You successfully created the account as a patient.",
            img: 'images/success.webp',
          ),
        );
        Navigator.of(this.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => SignIn(),
            ),
            (Route<dynamic> route) => false);
      }
    } catch (error) {
      print("this is the error" + error);
    }
  }

  List services = [];

  String availableTimeFrom = '8 AM';
  String availableTimeTo = '8 AM';
  String province = 'Central Province';
  String district = 'Colombo';

  bool onlineChannel = false;
  bool physicalChannel = false;
  bool onlineYoga = false;

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

    final textTitleMain = 'SIGN UP';
    final textTitleSub = 'Doctor';

    final buttonText = 'Sign Up';
    final callFunction = SignIn(
      key: null,
    );
    final topPadding = 25.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarMain(textTitleMain, textTitleSub),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  inputFieldsReg(
                      'Name', _name, "Username can't be empty", false),
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
                      "Position can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg(
                      'Hospital', _hospital, "Hospital can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg(
                      'Password', _password, "Password can't be empty", true),
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
                  //buttonInPages(buttonText, context, callFunction, topPadding),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: topPadding),
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: secondaryColorOne),
                      onPressed: () {
                        registerUser(
                          _name.text,
                          _email.text,
                          _phone.text,
                          _password.text,
                          district,
                          province,
                          _genderRadioBtnVal,
                          _doctorId.text,
                          _position.text,
                          _hospital.text,
                          _lane.text,
                          availableTimeFrom,
                          availableTimeTo,
                          services.toString(),
                        );
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
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignIn(
                                    key: null,
                                  )),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: secondaryColorOne,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: primaryColor,
                              shadows: [
                                letterShadow,
                              ],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
