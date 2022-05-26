import 'package:flutter/material.dart';

import '../../../styles/appBar.dart';
import '../../../styles/customDialogBox.dart';
import '../../../styles/navigationDrawerDoctor.dart';
import '../../../styles/navigationDrawerPatient.dart';
import '../../../styles/urlForAPI.dart';
import '../../../styles/variables.dart';
import 'added_prescriptions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditPrescription extends StatefulWidget {
  final int dataFromResponse;
  const EditPrescription(this.dataFromResponse, {Key key}) : super(key: key);

  @override
  _EditPrescriptionState createState() =>
      _EditPrescriptionState(dataFromResponse);
}

class _EditPrescriptionState extends State<EditPrescription> {
  _EditPrescriptionState(this.dataFromResponse);

  final int dataFromResponse;

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

  editPrescription(String patientName, String prescription) async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    String id = (prefs.getString('id') ?? '');
    var url = Uri.parse(baseUrl +
        'api/Prescriptions/edit-prescription/' +
        dataFromResponse.toString());

    print(url);
    //print(prefs.getString('id') ?? '');
    //print(token);

    Map<String, dynamic> data = {
      "patientId": selectedValue,
      "prescription": prescription,
    };

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
    //editPrescription('p', 'p');
    final pageTitle = "Update Prescription";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update ';
    final callFunction = AddedList();
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
                Text(
                  'You can update the prescription. But, patients name is unable to change.',
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: topPadding),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: secondaryColorOne),
                          onPressed: () {
                            editPrescription(selectedValue, _prescription.text);
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
