import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/appBarMain.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class SignUpDoctor extends StatefulWidget {
  const SignUpDoctor({Key key}) : super(key: key);

  @override
  _SignUpDoctorState createState() => _SignUpDoctorState();
}

class _SignUpDoctorState extends State<SignUpDoctor> {
  bool onlineChannel = false;
  bool physicalChannel = false;
  bool onlineYoga = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return primaryColor;
      }
      return secondaryColorOne;
    }

    final textTitleMain = 'SIGN UP';
    final textTitleSub = 'Doctor';

    final buttonText = 'Sign Up';
    final callFunction = SignIn();
    final topPadding = 25.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarMain(textTitleMain, textTitleSub),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                inputFields('Name'),
                spaceBetweenInputFields,
                inputFields('Email'),
                spaceBetweenInputFields,
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: primaryColor,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                    ),
                    Radio(
                      value: 0,
                      groupValue: 1,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Female",
                      style: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                inputFields('Doctor ID'),
                spaceBetweenInputFields,
                inputFields('Position'),
                spaceBetweenInputFields,
                inputFields('Hospital'),
                spaceBetweenInputFields,
                inputFields('Password'),
                spaceBetweenInputFields,
                Row(
                  children: [
                    Text(
                      "Personal Address",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                inputFields('Lane'),
                spaceBetweenInputFields,
                inputFields('District'),
                spaceBetweenInputFields,
                inputFields('Province'),
                spaceBetweenInputFields,
                Row(
                  children: [
                    Text(
                      "Available Time",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "From",
                        style: TextStyle(
                          color: secondaryColorOne,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        width: 200.0,
                      ),
                      DropdownButton<String>(
                        items: <String>[
                          '10.00 am',
                          '11.00 am',
                          '12.00 am',
                          '13.00 am',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "To",
                        style: TextStyle(
                          color: secondaryColorOne,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        width: 220.0,
                      ),
                      DropdownButton<String>(
                        items: <String>[
                          '10.00 am',
                          '11.00 am',
                          '12.00 am',
                          '13.00 am',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                Row(
                  children: [
                    Text(
                      "Service Types",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: onlineChannel,
                      onChanged: (bool value) {
                        setState(() {
                          onlineChannel = value;
                        });
                      },
                    ),
                    Text(
                      "Online Consulting",
                      style:
                          TextStyle(color: secondaryColorOne, fontSize: 15.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: physicalChannel,
                      onChanged: (bool value) {
                        setState(() {
                          physicalChannel = value;
                        });
                      },
                    ),
                    Text(
                      "Physical Channeling",
                      style:
                          TextStyle(color: secondaryColorOne, fontSize: 15.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: onlineYoga,
                      onChanged: (bool value) {
                        setState(() {
                          onlineYoga = value;
                        });
                      },
                    ),
                    Text(
                      "Online Yoga",
                      style:
                          TextStyle(color: secondaryColorOne, fontSize: 15.0),
                    ),
                  ],
                ),
                spaceBetweenInputFields,
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: secondaryColorOne,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: primaryColor,
                            shadows: [
                              letterShadow,
                            ],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
