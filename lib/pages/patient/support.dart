import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/variables.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../styles/customDialogBox.dart';
import '../../styles/urlForAPI.dart';

class SupportPatient extends StatefulWidget {
  const SupportPatient({Key key}) : super(key: key);

  @override
  _SupportPatientState createState() => _SupportPatientState();
}

class _SupportPatientState extends State<SupportPatient> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _subject = TextEditingController();
  TextEditingController _description = TextEditingController();

  Map userDetails;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var res;
  var getRes;

  sendInquiry(
      String name, String email, String subject, String description) async {
    print("re occurring");
    var url = Uri.parse(baseUrl + 'api/Inquiries');
    print(url);
    print(name);

    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "subject": subject,
      "description": description,
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
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Error",
            description: "Please enter the values in the correct format.",
          ),
        );
      }
      if (res.statusCode == 200) {
        var jsonResponse = json.decode(res.body);
        print(jsonResponse);
        print("Response Status: ${res.statusCode}");
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Success",
            description: "Your inquiry has been submitted",
          ),
        );
        Navigator.of(this.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => MainMenu(),
            ),
            (Route<dynamic> route) => false);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Support";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Send';
    final topPadding = 20.0;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                spaceBetweenInputFields,
                Text(
                  'If you need have any issue, you can send it to the admin through this. ',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17.0,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      spaceBetweenInputFields,
                      inputFieldsReg(
                          'Name', _name, "Name can't be empty", false),
                      spaceBetweenInputFields,
                      inputFieldsReg(
                          'Email', _email, "Email can't be empty", false),
                      spaceBetweenInputFields,
                      inputFieldsReg(
                          'Subject', _subject, "Subject can't be empty", false),
                      spaceBetweenInputFields,
                      inputFieldsReg('Description', _description,
                          "Description can't be empty", false),
                      spaceBetweenInputFields,
                      Container(
                        padding: EdgeInsets.symmetric(vertical: topPadding),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: secondaryColorOne),
                          onPressed: () {
                            sendInquiry(_name.text, _email.text, _subject.text,
                                _description.text);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
