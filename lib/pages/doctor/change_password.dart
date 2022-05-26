import 'dart:convert';

import 'package:ayu/pages/doctor_profile.dart';
import 'package:ayu/pages/profile.dart';
import 'package:ayu/styles/urlForAPI.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/appBar.dart';
import '../../styles/customDialogBox.dart';
import '../../styles/navigationDrawerPatient.dart';
import '../../styles/variables.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _password = TextEditingController();
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkColor = false;
  updatePassword(BuildContext context) async {
    var url = Uri.parse(baseUrl + '/auth/change-password');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    Map data = {
      "currentPassword": _currentPassword.text,
      "newPassword": _confirmPassword.text,
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
            description: "Successfully updated the  password",
          ),
        );
        Navigator.of(this.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => DoctorProfile(),
            ),
            (Route<dynamic> route) => false);
        _confirmPassword.clear();
        _password.clear();
        _currentPassword.clear();
        print("Response Status: ${res.statusCode}");

        if (jsonResponse != null) {}
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Change Password";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update';
    final callFunction = DoctorProfile();
    final topPadding = 25.0;
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawer(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter your current password, new password and type it again to confirm the newly entered password.',
                    style: TextStyle(color: primaryColor, fontSize: 17.0),
                  ),
                  spaceBetweenInputFields,
                  inputFieldsReg('Current Password', _currentPassword,
                      "Current Password can't be empty", true),
                  spaceBetweenInputFields,
                  inputFieldsReg('New Password', _password,
                      "New Password can't be empty", true),
                  spaceBetweenInputFields,
                  // inputFieldsReg('Confirm Password', _confirmPassword,
                  //     "Confirm Password can't be empty", false),
                  Container(
                    decoration: inputFieldDecoration,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        counterText: "",
                        contentPadding: EdgeInsets.all(10.0),
                        fillColor: whiteColor,
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: BorderSide.none),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: secondaryColorOne,
                        ),
                      ),
                      controller: _confirmPassword,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Confirm password can't be empty";
                        }
                        if (_password.text != _confirmPassword.text) {
                          return "Confirm password doesn't match ";
                        }
                        return null;
                      },
                    ),
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
                        updatePassword(context);
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
