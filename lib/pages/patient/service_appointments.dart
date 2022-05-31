import 'dart:convert';

import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/customDialogBox.dart';
import '../../styles/urlForAPI.dart';
import '../meeting_start.dart';
import 'package:http/http.dart' as http;

class BookedAppointments extends StatefulWidget {
  const BookedAppointments({Key key}) : super(key: key);

  @override
  _BookedAppointmentsState createState() => _BookedAppointmentsState();
}

class _BookedAppointmentsState extends State<BookedAppointments> {
  var userData;
  var classData;
  var channelData;

  Future getDataFromOnline() async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'appointment');

    //print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 405) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "405",
              ));
    }

    print(url);
    //print(response.body);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      userData = json.decode(response.body);
      //print("response body :" + json.decode(response.body));
      //print("hi");
      print(userData);

      return userData;
    } else {
      return "true";
    }
  }

  Future getDataFromClass() async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'yoga-class');

    //print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 405) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "405",
              ));
    }

    print(url);
    //print(response.body);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      classData = json.decode(response.body);
      //print("response body :" + json.decode(response.body));
      //print("hi");
      print(classData);

      return classData;
    } else {
      return "true";
    }
  }

  Future getDataFromChannel() async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'channel');

    //print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 405) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "405",
              ));
    }

    print(url);
    //print(response.body);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      channelData = json.decode(response.body);
      //print("response body :" + json.decode(response.body));
      //print("hi");
      print(channelData);

      return channelData;
    } else {
      return "true";
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Booked Appointments";
    final appBarBg = 'images/appbar-dark.webp';
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
              spaceCollapseMenu,
              FutureBuilder(
                  future: getDataFromOnline(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          for (var i = 0; i < userData.length; i++)
                            Container(
                              margin: const EdgeInsets.only(bottom: 15.0),
                              decoration: inputFieldDecoration,
                              child: ExpansionTile(
                                title: Text(
                                  'Appointment ' + i.toString(),
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
                                        image: ExactAssetImage(
                                            'images/light-bg.webp'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        listViewOnlineConsult(
                                            'Appointment 1',
                                            userData[i]['doctorName'],
                                            userData[i]['method'],
                                            userData[i]['date'],
                                            userData[i]['timeSlot']),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              17, 10, 30, 10),
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
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            secondaryColorThree, // background
                                                        onPrimary: Colors
                                                            .white, // foreground
                                                      ),
                                                      onPressed: () => {
                                                        {startMeeting(context)}
                                                      },
                                                      child: const Text(
                                                          'Start Meeting'),
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
                        ],
                      );
                    }
                    return Text(
                      'No Appointments for Online Consultation are found',
                      style: TextStyle(fontSize: 16.00, color: primaryColor),
                    );
                  }),
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
              FutureBuilder(
                  future: getDataFromClass(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        classData.length != 0) {
                      return Column(
                        children: [
                          for (var i = 0; i < classData.length; i++)
                            Container(
                              margin: const EdgeInsets.only(bottom: 15.0),
                              decoration: inputFieldDecoration,
                              child: ExpansionTile(
                                title: Text(
                                  'Appointment ' + i.toString(),
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
                                        image: ExactAssetImage(
                                            'images/light-bg.webp'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        listViewYoga(
                                            'Class 1',
                                            classData[i]['doctorName'],
                                            classData[i]['date'],
                                            classData[i]['timeSlot']),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              17, 10, 30, 10),
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
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            secondaryColorThree, // background
                                                        onPrimary: Colors
                                                            .white, // foreground
                                                      ),
                                                      onPressed: () => {
                                                        {startMeeting(context)}
                                                      },
                                                      child: const Text(
                                                          'Start Meeting'),
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
                        ],
                      );
                    }
                    return Text(
                      'No Yoga Classes are found',
                      style: TextStyle(fontSize: 16.00, color: primaryColor),
                      textAlign: TextAlign.left,
                    );
                  }),
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
              FutureBuilder(
                  future: getDataFromChannel(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        channelData.length != 0) {
                      return Column(
                        children: [
                          for (var i = 0; i < classData.length; i++)
                            Container(
                              margin: const EdgeInsets.only(bottom: 15.0),
                              decoration: inputFieldDecoration,
                              child: ExpansionTile(
                                title: Text(
                                  'Appointment ' + i.toString(),
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
                                        image: ExactAssetImage(
                                            'images/light-bg.webp'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        listViewYoga(
                                          'Channel Appointment 1',
                                          channelData[i]['doctorName'],
                                          channelData[i]['date'],
                                          channelData[i]['timeSlot'],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    }
                    return Text(
                      'No Appointments for Physical Channels are found',
                      style: TextStyle(fontSize: 16.00, color: primaryColor),
                    );
                  }),
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
