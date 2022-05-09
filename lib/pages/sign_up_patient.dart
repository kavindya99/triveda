import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/customDialogBox.dart';
import 'lists_for.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final textTitleMain = 'SIGN UP';
    final textTitleSub = 'Patient';

    final buttonText = 'Sign Up';
    final callFunction = SignIn();
    final topPadding = 25.0;

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    Map userDetails;
    String nic;
    TextEditingController _username = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _confirmPassword = TextEditingController();
    TextEditingController _gender = TextEditingController();
    int currentStep = 0;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _nicController = TextEditingController();
    var res;
    var getRes;
    bool _isloading = false;

    registerUser() async {
      print("re occurring");
      var url = Uri.parse('https://vms-sl.azurewebsites.net/auth/register');

      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map data = {
        "nic": nic,
        "firstName": userDetails['firstName'],
        "lastName": userDetails['lastName'],
        "username": _username.text,
        "email": _email.text,
        "phoneNumber": _phone.text.toString(),
        "password": _password.text,
        "gender": userDetails['gender'],
        "dob": userDetails["dateOfBirth"],
      };
      print(data);
      var body = json.encode(data);

      try {
        res = await http.post(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: body);
        print(res.statusCode);

        if (res.statusCode == 404) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong'),
            backgroundColor: Colors.red,
          ));
        }
        if (res.statusCode == 200) {
          var jsonResponse = json.decode(res.body);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Found'),
            backgroundColor: Colors.green,
          ));
          print("Response Status: ${res.statusCode}");
        }
      } catch (error) {
        print(error);
      }
    }

    String selectedValue1 = 'Central Province';
    String selectedValue2 = 'Colombo';

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarMain(textTitleMain, textTitleSub),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      inputFieldsReg(
                          'Name', _username, "Username can't be empty"),
                      spaceBetweenInputFields,
                      inputFieldsReg('Email', _email, "Email can't be empty"),
                      spaceBetweenInputFields,
                      inputFieldsReg(
                          'Contact No', _phone, "Contact No can't be empty"),
                      spaceBetweenInputFields,
                      inputFieldsReg(
                          'Password', _password, "Password can't be empty"),
                      spaceBetweenInputFields,
                      dropDownItems(selectedValue1, setState, districts),
                      spaceBetweenInputFields,
                      dropDownItems(selectedValue2, setState, provinces),
                      spaceBetweenInputFields,
                    ],
                  ),
                ),
                buttonInPages(buttonText, context, callFunction, topPadding),
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
    );
  }
}
