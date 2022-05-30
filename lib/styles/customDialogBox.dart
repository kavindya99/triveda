import 'dart:async';

import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, img;

  const CustomDialog({
    Key key,
    this.title,
    this.description,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _timerToShowFirstDialog() async {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        dialogContent(context);
      });
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: whiteColor,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    Timer _timer;

    _timer = Timer(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(primary: buttonColor),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text(buttonText),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 50,
            backgroundImage: AssetImage(img),
          ),
        ),
      ],
    );
  }
}
