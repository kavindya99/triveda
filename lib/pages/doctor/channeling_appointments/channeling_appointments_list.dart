import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key key}) : super(key: key);

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Appointment List";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

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
                  'Channeling appointments appointed for you are displayed here. ',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17.0,
                  ),
                ),
                spaceBetweenInputFields,
                listViewChannelAppointments('Appointment 2', "Jennifer Ronly",
                    'Video', '2022.08.06.', '4.00 - 4.30'),
                spaceBetweenInputFields,
                listViewChannelAppointments('Appointment 2', "Jennifer Ronly",
                    'Video', '2022.08.06.', '4.00 - 4.30'),
                spaceBetweenInputFields,
                listViewChannelAppointments('Appointment 2', "Jennifer Ronly",
                    'Video', '2022.08.06.', '4.00 - 4.30'),
                spaceBetweenInputFields,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
