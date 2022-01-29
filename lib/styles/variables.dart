import 'package:flutter/material.dart';

Color primaryColor = Color.fromRGBO(95, 141, 136, 1);
Color secondaryColorOne = Color.fromRGBO(174, 182, 142, 1);
Color secondaryColorTwo = Color.fromRGBO(186, 198, 184, 1);
Color secondaryColorThree = Color.fromRGBO(215, 218, 180, 1);
Color errorColor = Color.fromRGBO(208, 72, 72, 1);

Color shadowColor = Color.fromRGBO(0, 0, 0, 0.25);
Shadow letterShadow = Shadow(
  blurRadius: 4.0,
  color: shadowColor,
  offset: Offset(1.0, 2.0),
);

Shadow boxShadow = BoxShadow(
  color: shadowColor,
  spreadRadius: 0,
  blurRadius: 4,
  offset: Offset(1.0, 2.0), // changes position of shadow
);

BoxDecoration inputFieldDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: new BorderRadius.circular(10.0),
  boxShadow: [
    boxShadow,
  ],
);

SizedBox spaceSignUpDoctor = SizedBox(
  height: 30.0,
);
