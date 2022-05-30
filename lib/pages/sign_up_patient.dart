import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/customDialogBox.dart';
import '../styles/urlForAPI.dart';
import 'lists_for.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  String district = 'Colombo';
  String province = 'Central Province';

  Map userDetails;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var res;
  var getRes;

  registerUser(String name, String email, String phoneNumber, String password,
      String district, String province) async {
    print("re occurring");
    var url = Uri.parse(baseUrl + 'auth/patient-register');
    print(url);
    print(name);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "province": province,
      "district": district,
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
                  ));
        } else if (_password.text.length < 10 || _password.text.length > 10) {
          print(res.statusCode);
          showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
              title: "Error",
              description: "Your contact number is less than 10 numbers",
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
            ),
          );
        } else {
          showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
              title: "Error",
              description: "Please enter the values in the correct format.",
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
          ),
        );
        Navigator.of(this.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => SignIn(),
            ),
            (Route<dynamic> route) => false);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTitleMain = 'SIGN UP';
    final textTitleSub = 'Patient';

    final buttonText = 'Sign Up';
    final topPadding = 25.0;

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarMain(textTitleMain, textTitleSub),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    inputFieldsReg(
                        'Name', _name, "Username can't be empty", false),
                    spaceBetweenInputFields,
                    inputFieldsReg(
                        'Email', _email, "Email can't be empty", false),
                    spaceBetweenInputFields,
                    inputFieldsReg('Contact No', _phone,
                        "Contact No can't be empty", false),
                    spaceBetweenInputFields,
                    inputFieldsReg(
                        'Password', _password, "Password can't be empty", true),
                    spaceBetweenInputFields,
                    //dropDownItems(district, setState, districts),
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
                  ],
                ),
              ),
              // buttonInPages(buttonText, context, callFunction, topPadding),
              Container(
                padding: EdgeInsets.symmetric(vertical: topPadding),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    registerUser(_name.text, _email.text, _phone.text,
                        _password.text, district, province);
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
    );
  }
}
