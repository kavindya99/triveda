import 'package:ayu/pages/doctor/channeling_appointments/channeling_appointmnets.dart';
import 'package:ayu/pages/doctor/doctor_search.dart';
import 'package:ayu/pages/doctor/online_consultation/online_consultation.dart';
import 'package:ayu/pages/doctor/prescription/add_new_prescription.dart';
import 'package:ayu/pages/doctor/support.dart';
import 'package:ayu/pages/doctor/wallet/wallet.dart';
import 'package:ayu/pages/doctor/yoga_classes/yoga_classes.dart';
import 'package:ayu/pages/main_menu_doctor.dart';
import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class NavigationDrawerDoctor extends StatefulWidget {
  const NavigationDrawerDoctor({Key key}) : super(key: key);

  @override
  _NavigationDrawerDoctorState createState() => _NavigationDrawerDoctorState();
}

class _NavigationDrawerDoctorState extends State<NavigationDrawerDoctor> {
  bool get isCollapsed => null;

  @override
  Widget build(BuildContext context) {
    final isCollpased = true;
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 5.0);

    return Container(
      width: isCollpased ? MediaQuery.of(context).size.width * 0.8 : null,
      child: Container(
        color: primaryColor,
        child: Column(
          children: [
            Container(
              padding: safeArea,
              child: buildHeader(isCollapsed),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 200.0,
                decoration: new BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    navigationDrawer(context, OnlineConsultationDoctor(),
                        'Online Consultation'),
                    navigationDrawer(
                        context, Appointments(), 'Channeling Appointments'),
                    navigationDrawer(context, AddNew(), 'Add Prescription'),
                    navigationDrawer(context, YogaClasses(), 'Yoga Classes'),
                    navigationDrawer(context, DoctorSearch(), 'Doctor Search'),
                    navigationDrawer(context, SupportDoctor(), 'Support'),
                    navigationDrawer(context, Wallet(), 'Wallet'),
                    SizedBox(
                      height: 100.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: whiteColor,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn(
                                          key: null,
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/logout.webp'),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollpased) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CloseButton(
            color: whiteColor,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainMenuDoctor()));
            },
            child: Container(
              child: Expanded(
                child: Image.asset(
                  'images/logo-app.webp',
                  width: 40.0,
                ),
              ),
            ),
          ),
        ],
      );
}
