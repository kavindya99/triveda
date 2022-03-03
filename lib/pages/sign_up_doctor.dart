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

    final items = ['From', 'To', 'Three', 'Four'];
    String selectedValue1 = 'From';
    String selectedValue2 = 'To';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarMain(textTitleMain, textTitleSub),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(color: secondaryColorOne),
                      isExpanded: true,
                      value: selectedValue1,
                      onChanged: (String newValue) =>
                          setState(() => selectedValue1 = newValue),
                      items: items
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      // add extra sugar..
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: primaryColor,
                      ),
                      underline: SizedBox(),
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(color: secondaryColorOne),
                      isExpanded: true,
                      value: selectedValue2,
                      onChanged: (String newValue) =>
                          setState(() => selectedValue2 = newValue),
                      items: items
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      // add extra sugar..
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: primaryColor,
                      ),
                      underline: SizedBox(),
                    ),
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
