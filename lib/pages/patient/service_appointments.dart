import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class BookedAppointments extends StatefulWidget {
  const BookedAppointments({Key key}) : super(key: key);

  @override
  _BookedAppointmentsState createState() => _BookedAppointmentsState();
}

class _BookedAppointmentsState extends State<BookedAppointments> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Booked Appointments";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              spaceBetweenInputFields,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Online Consultation",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              spaceCollapseMenu,
              listViewOnlineConsult('Appointment 1', 'Jennifer Ronly', 'Video',
                  '2022.08.06.', '4.00 - 4.30', 'click to join meeting'),
              Text(
                'No Appointments for Online Consultation are found',
                style: TextStyle(fontSize: 16.00, color: primaryColor),
              ),
              spaceBetweenInputFields,
              Row(
                children: [
                  Text(
                    "Yoga Class List",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              spaceCollapseMenu,
              listViewYoga('Class 1', "Jennifer Ronly", '2022.08.06.',
                  '4.00 - 4.30', 'click to join meeting'),
              Text(
                'No Yoga Classes are found',
                style: TextStyle(fontSize: 16.00, color: primaryColor),
                textAlign: TextAlign.left,
              ),
              spaceBetweenInputFields,
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Channeling Appointments List",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              spaceCollapseMenu,
              listViewYoga('Channel Appointment 1', 'Doctor Name',
                  '2022.08.06.', '4.00 - 4.30', 'click to join meeting'),
              Text(
                'No Appointments for Physical Channels are found',
                style: TextStyle(fontSize: 16.00, color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
