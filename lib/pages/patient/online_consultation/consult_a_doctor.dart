import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../styles/customDialogBox.dart';
import '../../../styles/urlForAPI.dart';
import '../../lists_for.dart';

class ConsultADoctor extends StatefulWidget {
  const ConsultADoctor({Key key}) : super(key: key);

  @override
  _ConsultADoctorState createState() => _ConsultADoctorState();
}

class _ConsultADoctorState extends State<ConsultADoctor> {
  String doctorName = 'Doctor';
  String type = 'Online Consulation(Audio)';
  String timeSlot = '8 AM - 8.30 AM';
  String district = 'Colombo';
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(DateTime.now().year - 5);
  final lastDate = DateTime(DateTime.now().year + 5);
  DateTime date;
  var displayDate;
  String _mySelection;
  var feeData;

  String getText() {
    if (date == null) {
      return selectedDate.toString().split(' ')[0];
    } else {
      displayDate = date.toString();
    }
  } //end get state

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  apiCall(BuildContext context) async {
    http.Response response;
    var url = Uri.parse(baseUrl + 'appointment');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');

    Map<String, dynamic> data = {
      "doctorName": _mySelection.toString(),
      "date": selectedDate.toString().split(' ')[0],
      "method": type,
      "timeSlot": timeSlot,
      "meetingPassword": getRandomString(6),
    };

    var body = json.encode(data);
    response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);
    if (response.statusCode == 200) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Success",
                description: "Successfully added the Appointment",
                img: 'images/success.webp',
              ));
    }
    return response.body;
  } //end api call

  //edited line
  List<Doctor> doctor = List<Doctor>();

  Future<Doctor> getDataFromApi() async {
    http.Response response;
    var url = Uri.parse(baseUrl + "user/doctors-online-consulting");
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    var data = json.decode(response.body);

    List<Doctor> results = [];
    data.forEach((data) {
      var model = Doctor();

      model.name = data["name"].toString();

      results.add(model);
    });
    if (mounted) {
      doctor = results;
    }
  } //end gate data from api

  Future<String> getFee() async {
    http.Response response;
    var url = Uri.parse(baseUrl + "api/Fees");

    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.body != null) {
      //print(url);
      //print(json.decode(response.body));
      var jsonData = json.decode(response.body.toString());
      feeData = jsonData;

      return feeData;
    } else {
      return "true";
    }
  } //end getting fee

  @override
  Widget build(BuildContext context) {
    // print(data);
    getFee();
    getDataFromApi();
    Doctor dropdownValue;
    final pageTitle = "Consult a Doctor";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;
    final buttonText = 'Book';
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
                    alignment: Alignment.center,
                    child: Column(children: [
                      spaceBetweenInputFields,
                      Text(
                        'You can book an appointment for a doctor by selecting the doctor name, date, method and a time slot, to get consultation via online ',
                        style: TextStyle(color: primaryColor, fontSize: 17.0),
                      ),
                      spaceBetweenInputFields,
                      Container(
                          width: double.infinity,
                          decoration: inputFieldDecoration,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: FutureBuilder(
                                  future: getDataFromApi(), // async work
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return DropdownButton<Doctor>(
                                        hint: Text(
                                          _mySelection == null
                                              ? "Select a Doctor"
                                              : _mySelection.toString(),
                                          style: TextStyle(
                                              color: secondaryColorOne),
                                        ),
                                        value: dropdownValue,
                                        style: TextStyle(
                                          color: secondaryColorOne,
                                          fontSize: 16.0,
                                        ),
                                        isExpanded: true,
                                        elevation: 16,
                                        underline: SizedBox(),
                                        onChanged: (Doctor newVal) {
                                          setState(() {
                                            dropdownValue = newVal;
                                            _mySelection = dropdownValue.name;
                                          });
                                        },
                                        items: doctor
                                            .map<DropdownMenuItem<Doctor>>(
                                                (Doctor value) {
                                          return DropdownMenuItem<Doctor>(
                                            value: value,
                                            child: Text(value.name.toString()),
                                          );
                                        }).toList(),
                                      );
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 15),
                                      child: Text(
                                        "Checking Doctor..",
                                        style: TextStyle(
                                          color: secondaryColorOne,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    );
                                  }))),
                      spaceBetweenInputFields,
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: whiteColor),
                          onPressed: () => _openDatePicker(context),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Row(
                              children: [
                                Text(
                                  getText(),
                                  style: TextStyle(
                                      color: secondaryColorOne,
                                      fontSize: 16.0,
                                      // shadows: [
                                      //   letterShadow,
                                      // ],
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
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
                            value: type,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            underline: SizedBox(),
                            onChanged: (String newValue) {
                              setState(() {
                                type = newValue;
                              });
                            },
                            items: <String>[
                              'Online Consulation(Audio)',
                              'Online Consulation(Video)'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
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
                            value: timeSlot,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            underline: SizedBox(),
                            onChanged: (String newValue) {
                              setState(() {
                                timeSlot = newValue;
                              });
                            },
                            items: timeSlots
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      spaceBetweenInputFields,
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Doctor Name : ',
                              style: TextStyle(
                                color: secondaryColorOne,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              _mySelection.toString(),
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      spaceBetweenInputFields,
                      FutureBuilder(
                          future: getDataFromApi(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Row(
                                children: [
                                  Text(
                                    'Consulting Fee : ',
                                    style: TextStyle(
                                      color: secondaryColorOne,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  if (type == 'Online Consulation(Audio)')
                                    Text(
                                      'LKR ' + feeData[1]['fee'],
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  else if (type == 'Online Consulation(Video)')
                                    Text(
                                      'LKR ' + feeData[0]['fee'],
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                ],
                              );
                            }
                            return Row(
                              children: [
                                Text(
                                  'Consulting Fee : ',
                                  style: TextStyle(
                                    color: secondaryColorOne,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text("LKR ...",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            );
                          }),
                      spaceBetweenInputFields,
                      Container(
                        padding: EdgeInsets.symmetric(vertical: topPadding),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: secondaryColorOne),
                          onPressed: () {
                            apiCall(context);
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
                    ] //childern
                        )))));
  } //end build

  _openDatePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor, // header background color
                onPrimary: whiteColor, // header text color
                onSurface: primaryColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: primaryColor, // button text color
                ),
              ),
            ),
            child: child ?? Text(""),
          );
        });
    if (date != null) {
      setState(() {
        selectedDate = date;
        print(selectedDate);
      });
    }
  }
} //end _ConsultADoctorState

class Doctor {
  String id;
  String name;
  String email;
  String phoneNumber;
  Bool gender;
  String medicalCouncilRegID;
  String specialization;
  String hospital;
  String lane;
  String province;
  String district;
  String availableTimeFrom;
  String availableTimeTo;
  String serviceType;
  Bool status;
  Bool deleteStatus;
  Bool role;
}
