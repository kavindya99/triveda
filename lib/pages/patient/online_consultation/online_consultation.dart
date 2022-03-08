import 'package:ayu/pages/patient/doctor_list.dart';
import 'package:ayu/pages/patient/online_consultation/consult_a_doctor.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnlineConsultaion extends StatefulWidget {
  const OnlineConsultaion({Key key}) : super(key: key);

  @override
  _OnlineConsultaionState createState() => _OnlineConsultaionState();
}

class _OnlineConsultaionState extends State<OnlineConsultaion> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Online Consultation";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;

    final buttonText1 = 'Doctor List';
    final callFunction1 = DoctorList();
    final buttonText2 = 'Consult a Doctor';
    final callFunction2 = ConsultADoctor();
    final topPadding1 = 10.0;
    final topPadding2 = 00.0;

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
                      'Consult a Doctor',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You can consult your doctor via',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'online platform',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText2, context, callFunction2, topPadding2),
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
