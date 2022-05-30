import 'package:ayu/pages/doctor/prescription/added_prescriptions.dart';
import 'package:ayu/pages/doctor/prescription/prescription.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../styles/customDialogBox.dart';
import '../../../styles/urlForAPI.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  TextEditingController _prescription = TextEditingController();

  Map userDetails;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var response;
  var getRes;

  final patients = [
    '581dbb88-01d6-42b9-89bb-46efe4261d55',
    'Patient Name1',
    'Patient Name2',
    'Patient Name3'
  ];
  String selectedValue = 'Patient Name1';

  addPrescription(String patientName, String prescription) async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    String id = (prefs.getString('id') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'api/Prescriptions');

    print(prefs.getString('id') ?? '');
    //print(prefs.getString('id') ?? '');
    //print(token);

    Map<String, dynamic> data = {
      "PatientName": selectedValue,
      "prescription": prescription,
    };

    print(data);
    print(data);
    var body = json.encode(data);
    print(body);

    response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);

    //var res = json.encode(response.body);
    //print(res);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      print("Response Status: ${response.statusCode}");
      showDialog(
        context: this.context,
        builder: (context) => CustomDialog(
          title: "Success",
          description: "You successfully added the prescription.",
        ),
      );
      Navigator.of(this.context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => AddedList(),
          ),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    //addPrescription('miss', 'med1:5g,med2:3g');
    final pageTitle = "Add Prescription";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add ';
    final callFunction = Prescription();
    final topPadding = 20.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarDoctorComponent(
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
                  'You can add prescription to the patients. First write the name of the medicine,then write the amount next by separating name and amount with a \' : \' mark.',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                            value: selectedValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            underline: SizedBox(),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            },
                            items: patients
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
                      // inputFields('Prescription'),
                      inputFieldsReg('Prescription', _prescription,
                          "Prescription can't be empty", false),
                      // buttonInPages(buttonText, context, callFunction, topPadding),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: topPadding),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: secondaryColorOne),
                          onPressed: () {
                            addPrescription(selectedValue, _prescription.text);
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
