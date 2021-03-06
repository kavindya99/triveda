import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import '../../meeting_start.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Patient List";
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
                  'Online consultations appointed for you are displayed here. ',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17.0,
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: ExpansionTile(
                    title: Text(
                      'Appointment 1',
                      style: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                          image: new DecorationImage(
                            image: ExactAssetImage('images/light-bg.webp'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          children: [
                            listViewOnlineConsult('Patient 1', 'Jennifer Ronly',
                                'Video', '2022.08.06.', '4.00 - 4.30'),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(17, 10, 30, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Meeting Link",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        // The basic Material Design action button.
                                        return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                secondaryColorThree, // background
                                            onPrimary:
                                                Colors.white, // foreground
                                          ),
                                          onPressed: () => {
                                            {startMeeting(context)}
                                          },
                                          child: const Text('Start Meeting'),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: ExpansionTile(
                    title: Text(
                      'Appointment 1',
                      style: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                          image: new DecorationImage(
                            image: ExactAssetImage('images/light-bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          children: [
                            listViewOnlineConsult('Patient 2', 'Jennifer Ronly',
                                'Video', '2022.08.06.', '4.00 - 4.30'),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(17, 10, 30, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Meeting Link",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        // The basic Material Design action button.
                                        return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                secondaryColorThree, // background
                                            onPrimary:
                                                Colors.white, // foreground
                                          ),
                                          onPressed: () => {
                                            {startMeeting(context)}
                                          },
                                          child: const Text('Start Meeting'),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: ExpansionTile(
                    title: Text(
                      'Appointment 1',
                      style: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                          image: new DecorationImage(
                            image: ExactAssetImage('images/light-bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          children: [
                            listViewOnlineConsult('Patient 3', 'Jennifer Ronly',
                                'Video', '2022.08.06.', '4.00 - 4.30'),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(17, 10, 30, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Meeting Link",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        // The basic Material Design action button.
                                        return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                secondaryColorThree, // background
                                            onPrimary:
                                                Colors.white, // foreground
                                          ),
                                          onPressed: () => {
                                            {startMeeting(context)}
                                          },
                                          child: const Text('Start Meeting'),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                spaceBetweenInputFields,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
