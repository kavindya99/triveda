import 'dart:io';

import 'package:ayu/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/appBar.dart';
import '../../styles/navigationDrawerPatient.dart';
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

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Edit Profile";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update Profile';
    final callFunction = Profile();
    final topPadding = 25.0;
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
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
                inputFields('Password'),
                spaceBetweenInputFields,
                inputFields('Province'),
                spaceBetweenInputFields,
                inputFields('District'),
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
                  aspectRatio: 451 / 451,
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
