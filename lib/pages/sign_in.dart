import 'dart:convert';

import 'package:ayu/pages/forget_password.dart';
import 'package:ayu/pages/main_menu_doctor.dart';
import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/pages/sign_up_doctor.dart';
import 'package:ayu/pages/sign_up_patient.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/body-dark.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/customDialogBox.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  login(String userName, String password) async {
    print(userName);
    var url = Uri.parse("https://vms-sl.azurewebsites.net/auth/login");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {"userName": userName, "password": password};
    var body = json.encode(data);
    print(url);
    var jsonResponse;

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "fill all",
              ));
    }
    try {
      var res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);
        var role = jsonResponse["role"];
        if (role == []) {
          //if role is doctor
          Navigator.of(this.context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => MainMenu()),
              (Route<dynamic> route) => false);
        } else if (role == "patient") {
          //if role is patient
          Navigator.of(this.context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => MainMenu()),
              (Route<dynamic> route) => false);
        } else if (role == "admin") {
          //if role is admin
          showDialog(
              context: this.context,
              builder: (context) => CustomDialog(
                    title: "Error",
                    description: "User doesn't has access to login",
                  ));
        }

        print("Response Status: ${res.statusCode}");
        print(role);
        if (res.statusCode == 403) {
          print(json.decode(res.body));
        }

        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });

          sharedPreferences.setString("token", jsonResponse['token']);
          sharedPreferences.setString("name", jsonResponse['userName']);

          Navigator.of(this.context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => MainMenu()),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }
      if (res.statusCode == 503) {
        print("Server under maintenance, Please check after a while ");
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Error",
                  description:
                      "Server under maintenance, Please check after a while",
                ));
      } else if (res.statusCode == 401) {
        print(json.decode(res.body));
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Login Failed",
                  description:
                      "Login failed due to incorrect login credentials. Try with correct ones",
                ));
      }
    } catch (error) {
      print(error);
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "Login Failed. Try Again",
              ));
      Navigator.of(this.context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => MainMenuDoctor()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTitle = 'SIGN IN';

    final buttonText = 'Sign In';
    //final callFunction = MainMenu();
    final callFunction = MainMenuDoctor();
    final topPadding = 5.0;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarMain(textTitle, ''),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: whiteColor,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: BorderSide.none),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: whiteColor,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: BorderSide.none),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50.0),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: primaryColor,
                        shadows: [
                          letterShadow,
                        ],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                //buttonInPages(buttonText, context, callFunction, topPadding),
                Container(
                  padding: EdgeInsets.symmetric(vertical: topPadding),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                    onPressed: () {
                      login(_emailController.text, _passwordController.text);
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => CustomDialog(
                      //           title: "Success",
                      //           description:
                      //               "this is the success alert this is the success alert this is the success alert this is the success alert this is the success alert this is the success alert",
                      //         ));
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
                  padding: EdgeInsets.only(top: 50.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an Account? Sign Up as a",
                            style: TextStyle(
                              color: secondaryColorOne,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpDoctor()),
                              );
                            },
                            child: Text(
                              "DOCTOR",
                              style: TextStyle(
                                color: primaryColor,
                                shadows: [
                                  letterShadow,
                                ],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            "or ",
                            style: TextStyle(
                              color: secondaryColorOne,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                            child: Text(
                              "PATIENT",
                              style: TextStyle(
                                color: primaryColor,
                                shadows: [
                                  letterShadow,
                                ],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
