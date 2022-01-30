import 'package:flutter/material.dart';

Color primaryColor = Color.fromRGBO(95, 141, 136, 1);
Color secondaryColorOne = Color.fromRGBO(174, 182, 142, 1);
Color secondaryColorTwo = Color.fromRGBO(186, 198, 184, 1);
Color secondaryColorThree = Color.fromRGBO(215, 218, 180, 1);
Color errorColor = Color.fromRGBO(208, 72, 72, 1);
Color whiteColor = Colors.white;

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

SizedBox spaceBetweenInputFields = SizedBox(
  height: 30.0,
);

SizedBox spaceCollapseMenu = SizedBox(
  height: 30.0,
);

Container inputFields(hint) => Container(
      decoration: inputFieldDecoration,
      child: TextField(
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.all(10.0),
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: TextStyle(
            color: secondaryColorOne,
          ),
        ),
      ),
    );

Container buttonInPages(buttonText, context, callFunction, topPadding) =>
    Container(
      padding: EdgeInsets.symmetric(vertical: topPadding),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: secondaryColorOne),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => callFunction));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                shadows: [
                  letterShadow,
                ],
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
