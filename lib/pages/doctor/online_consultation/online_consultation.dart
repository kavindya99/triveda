import 'package:ayu/pages/doctor/online_consultation/patient_list.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class OnlineConsultationDoctor extends StatefulWidget {
  const OnlineConsultationDoctor({Key key}) : super(key: key);

  @override
  _OnlineConsultationDoctorState createState() =>
      _OnlineConsultationDoctorState();
}

class _OnlineConsultationDoctorState extends State<OnlineConsultationDoctor> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Online Consultation";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;

    final buttonText1 = 'Patient List';
    final callFunction1 = PatientList();
    final topPadding1 = 10.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/online-consultation.gif",
                      height: 229.0,
                      width: 298.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Online Consultation List',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'The list of online consultation appointments are stated here with details ',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText1, context, callFunction1, topPadding1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
