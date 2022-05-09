import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import '../meeting_start.dart';

class BookedAppointments extends StatefulWidget {
  const BookedAppointments({Key key}) : super(key: key);

  @override
  _BookedAppointmentsState createState() => _BookedAppointmentsState();
}

class _BookedAppointmentsState extends State<BookedAppointments> {
  // TextEditingController meetingIdController = TextEditingController();
  // TextEditingController meetingPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Booked Appointments";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;
    var meetingTime;

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
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Builder(
              //     builder: (context) {
              //       // The basic Material Design action button.
              //       return ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           primary: Colors.blue, // background
              //           onPrimary: Colors.white, // foreground
              //         ),
              //         onPressed: () => {
              //           {startMeeting(context)}
              //         },
              //         child: const Text('Start Meeting'),
              //       );
              //     },
              //   ),
              // ),
              spaceCollapseMenu,
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
                          listViewOnlineConsult(
                              'Appointment 1',
                              'Jennifer Ronly',
                              'Video',
                              '2022.08.06.',
                              '4.00 - 4.30'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
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
                                          onPrimary: Colors.white, // foreground
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
                          listViewYoga('Class 1', "Jennifer Ronly",
                              '2022.08.06.', '4.00 - 4.30'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
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
                                          onPrimary: Colors.white, // foreground
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
                          listViewYoga('Channel Appointment 1', 'Doctor Name',
                              '2022.08.06.', '4.00 - 4.30'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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

  //API KEY & SECRET is required for below methods to work
  //Join Meeting With Meeting ID & Password

  // joinMeeting(BuildContext context) {
  //   bool _isMeetingEnded(String status) {
  //     var result = false;
  //
  //     if (Platform.isAndroid) {
  //       result = status == "MEETING_STATUS_DISCONNECTING" ||
  //           status == "MEETING_STATUS_FAILED";
  //     } else {
  //       result = status == "MEETING_STATUS_IDLE";
  //     }
  //
  //     return result;
  //   }
  //
  //   if (meetingIdController.text.isNotEmpty &&
  //       meetingPasswordController.text.isNotEmpty) {
  //     ZoomOptions zoomOptions = ZoomOptions(
  //       domain: "zoom.us",
  //       appKey: "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM
  //       appSecret:
  //           "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM
  //     );
  //     var meetingOptions = ZoomMeetingOptions(
  //         userId: 'username',
  //
  //         /// pass username for join meeting only --- Any name eg:- EVILRATT.
  //         meetingId: meetingIdController.text,
  //
  //         /// pass meeting id for join meeting only
  //         meetingPassword: meetingPasswordController.text,
  //
  //         /// pass meeting password for join meeting only
  //         disableDialIn: "true",
  //         disableDrive: "true",
  //         disableInvite: "true",
  //         disableShare: "true",
  //         disableTitlebar: "false",
  //         viewOptions: "true",
  //         noAudio: "false",
  //         noDisconnectAudio: "false");
  //
  //     var zoom = ZoomView();
  //     zoom.initZoom(zoomOptions).then((results) {
  //       if (results[0] == 0) {
  //         zoom.onMeetingStatus().listen((status) {
  //           if (kDebugMode) {
  //             print(
  //                 "[Meeting Status Stream] : " + status[0] + " - " + status[1]);
  //           }
  //           if (_isMeetingEnded(status[0])) {
  //             if (kDebugMode) {
  //               print("[Meeting Status] :- Ended");
  //             }
  //             timer.cancel();
  //           }
  //         });
  //         if (kDebugMode) {
  //           print("listen on event channel");
  //         }
  //         zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {
  //           timer = Timer.periodic(const Duration(seconds: 2), (timer) {
  //             zoom.meetingStatus(meetingOptions.meetingId).then((status) {
  //               if (kDebugMode) {
  //                 print("[Meeting Status Polling] : " +
  //                     status[0] +
  //                     " - " +
  //                     status[1]);
  //               }
  //             });
  //           });
  //         });
  //       }
  //     }).catchError((error) {
  //       if (kDebugMode) {
  //         print("[Error Generated] : " + error);
  //       }
  //     });
  //   } else {
  //     if (meetingIdController.text.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text("Enter a valid meeting id to continue."),
  //       ));
  //     } else if (meetingPasswordController.text.isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text("Enter a meeting password to start."),
  //       ));
  //     }
  //   }
  // }

  //Start Meeting With Random Meeting ID ----- Emila & Password For Zoom is required.
}
