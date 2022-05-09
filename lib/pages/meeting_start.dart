import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_sdk/zoom_options.dart';
import 'package:flutter_zoom_sdk/zoom_view.dart';

Timer timer;

startMeeting(BuildContext context) {
  bool _isMeetingEnded(String status) {
    var result = false;

    if (Platform.isAndroid) {
      result = status == "MEETING_STATUS_DISCONNECTING" ||
          status == "MEETING_STATUS_FAILED";
    } else {
      result = status == "MEETING_STATUS_IDLE";
    }

    return result;
  }

  ZoomOptions zoomOptions = ZoomOptions(
    domain: "zoom.us",
    appKey:
        "I0Fj5YEKXXhEqa4eNSaPNQ7Vcj2r3PwVqV9S", //API KEY FROM ZOOM -- SDK KEY
    appSecret:
        "3xpvmqOTXXplt6BmpiKKNcfaUb73a022mYK3", //API SECRET FROM ZOOM -- SDK SECRET
  );
  var meetingOptions = ZoomMeetingOptions(
      userId: 'evilrattdeveloper@gmail.com', //pass host email for zoom
      userPassword: 'Dlinkmoderm0641', //pass host password for zoom
      disableDialIn: "false",
      disableDrive: "false",
      disableInvite: "false",
      disableShare: "false",
      disableTitlebar: "false",
      viewOptions: "true",
      noAudio: "false",
      noDisconnectAudio: "false");

  var zoom = ZoomView();
  zoom.initZoom(zoomOptions).then((results) {
    if (results[0] == 0) {
      zoom.onMeetingStatus().listen((status) {
        if (kDebugMode) {
          print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
        }
        if (_isMeetingEnded(status[0])) {
          if (kDebugMode) {
            print("[Meeting Status] :- Ended");
          }
          timer.cancel();
        }
        if (status[0] == "MEETING_STATUS_INMEETING") {
          zoom.meetinDetails().then((meetingDetailsResult) {
            if (kDebugMode) {
              print("[MeetingDetailsResult] :- " +
                  meetingDetailsResult.toString());
            }
          });
        }
      });
      zoom.startMeeting(meetingOptions).then((loginResult) {
        if (kDebugMode) {
          print("[LoginResult] :- " + loginResult[0] + " - " + loginResult[1]);
        }
        if (loginResult[0] == "SDK ERROR") {
          //SDK INIT FAILED
          if (kDebugMode) {
            print((loginResult[1]).toString());
          }
          return;
        } else if (loginResult[0] == "LOGIN ERROR") {
          //LOGIN FAILED - WITH ERROR CODES
          if (kDebugMode) {
            if (loginResult[1] ==
                ZoomError.ZOOM_AUTH_ERROR_WRONG_ACCOUNTLOCKED) {
              print("Multiple Failed Login Attempts");
            }
            print((loginResult[1]).toString());
          }
          return;
        } else {
          //LOGIN SUCCESS & MEETING STARTED - WITH SUCCESS CODE 200
          if (kDebugMode) {
            print((loginResult[0]).toString());
          }
        }
      }).catchError((error) {
        if (kDebugMode) {
          print("[Error Generated] : " + error);
        }
      });
    }
  }).catchError((error) {
    if (kDebugMode) {
      print("[Error Generated] : " + error);
    }
  });
}
