import 'dart:io';

import 'package:ayu/pages/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/appBar.dart';
import '../../styles/navigationDrawerDoctor.dart';
import '../../styles/variables.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File image;

  Future pickIMage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

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

    final pageTitle = "Update Profile";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update Profile';
    final callFunction = DoctorProfile();
    final topPadding = 25.0;

    final items = ['From', 'To', 'District', 'Province'];
    String selectedValue1 = 'From';
    String selectedValue2 = 'To';
    String selectedValue3 = 'Province';
    String selectedValue4 = 'District';
    return Scaffold(
      backgroundColor: whiteColor,
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
                  'Enter new values to the fields which you need to update in your profile details',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
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
                dropDownItems(selectedValue3, setState, items),
                spaceBetweenInputFields,
                dropDownItems(selectedValue4, setState, items),
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
                dropDownItems(selectedValue1, setState, items),
                spaceBetweenInputFields,
                dropDownItems(selectedValue2, setState, items),
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
                MaterialButton(
                    child: Container(
                      decoration: inputFieldDecoration,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile Picture',
                              style: TextStyle(
                                  color: secondaryColorOne,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              // <-- Icon
                              Icons.image,
                              size: 24.0,
                              color: secondaryColorTwo,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onPressed: () {
                      pickIMage();
                    }),
                spaceBetweenInputFields,
                AspectRatio(
                  aspectRatio: 448 / 451,
                  child: Container(
                    child: image != null
                        ? Image.file(
                            image,
                            fit: BoxFit.fitWidth,
                            alignment: FractionalOffset.center,
                          )
                        : Text(''),
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
