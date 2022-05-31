import 'dart:convert';

import 'package:ayu/pages/forget_password.dart';
import 'package:ayu/pages/main_menu_doctor.dart';
import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/pages/sign_up_doctor.dart';
import 'package:ayu/pages/sign_up_patient.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles/customDialogBox.dart';
import '../styles/urlForAPI.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  var errorGif = 'images/error.webp';
  var successGif = 'images/success.webp';

  _launchURL() async {
    const url = 'https://triveda.azurewebsites.net/auth/forgot-Password';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  login(String userName, String password) async {
    print(userName);
    print(password);
    var url = Uri.parse(baseUrl + "auth/login");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {"email": userName, "password": password};
    var body = json.encode(data);
    print(url);
    var jsonResponse;

    try {
      var res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });
        jsonResponse = json.decode(res.body);
        print("Response Status: ${res.statusCode}");
        if (res.statusCode == 403) {
          print(json.decode(res.body));
        }

        if (jsonResponse != null) {
          print(jsonResponse['role']);
          print(jsonResponse['token']);
          print(jsonResponse['email']);
          sharedPreferences.setString("token", jsonResponse['token']);
          sharedPreferences.setString("email", jsonResponse['email']);
          // Navigator.of(this.context).pushAndRemoveUntil(
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => MainMenuDoctor()),
          //     (Route<dynamic> route) => false);
          var role = jsonResponse["role"];
          print(role);
          if (role == 1) {
            //if role is doctor
            Navigator.of(this.context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => MainMenuDoctor(),
                ),
                (Route<dynamic> route) => false);
          } else if (role == 2) {
            Navigator.of(this.context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => MainMenu(),
                ),
                (Route<dynamic> route) => false);
          } else {
            showDialog(
                context: this.context,
                builder: (context) => CustomDialog(
                      title: "Error",
                      description:
                          "You don't have access to mobile application",
                      img: errorGif,
                    ));
          }
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      }
      if (_emailController.text.isEmpty &&
          _passwordController.text.isNotEmpty) {
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Error",
                  description: "Please enter your email address",
                  img: errorGif,
                ));
      } else if (_emailController.text.isNotEmpty &&
          _passwordController.text.isEmpty) {
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Error",
                  description: "Please enter your password",
                  img: errorGif,
                ));
      } else if (_emailController.text.isEmpty &&
          _passwordController.text.isEmpty) {
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Error",
                  description: "Please enter your email address and password",
                  img: errorGif,
                ));
      } else if (!_emailController.text.contains('@') ||
          !_emailController.text.contains('.')) {
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Error",
                  description:
                      "Please enter your email address with the correct format",
                  img: errorGif,
                ));
      } else if (res.statusCode == 401) {
        setState(() {
          _isLoading = false;
        });
        print(_passwordController.text);
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Error",
                  description: "Incorrect email or password",
                  img: errorGif,
                ));
      } else if (res.statusCode == 503) {
        print("Server under maintenance, Please check after a while ");
      } else {
        showDialog(
            context: this.context,
            builder: (context) => CustomDialog(
                  title: "Success",
                  description: "Successfully Logged\n Welcome to Triveda",
                  img: successGif,
                ));
      }
    } catch (error) {
      print(error);
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        showDialog(
                          context: this.context,
                          builder: (context) => CustomDialog(
                            title: "Error",
                            description: "Please enter your email",
                            img: 'images/error.webp',
                          ),
                        );
                      }
                      return null;
                    },
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        showDialog(
                          context: this.context,
                          builder: (context) => CustomDialog(
                            title: "Error",
                            description: "Please enter your password",
                            img: 'images/error.webp',
                          ),
                        );
                      }
                      return null;
                    },
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     GestureDetector(
                //       onTap: _launchURL,
                //       child: Text("Forgot password?"),
                //     ),
                //   ],
                // ),
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
                      // Navigator.of(this.context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => MainMenu()),
                      //     (Route<dynamic> route) => false);
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
