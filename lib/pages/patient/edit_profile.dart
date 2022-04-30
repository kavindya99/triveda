import 'dart:io';

import 'package:ayu/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/appBar.dart';
import '../../styles/appBarMain.dart';
import '../../styles/variables.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;

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
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
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
                inputFields('Password'),
                spaceBetweenInputFields,
                inputFields('Province'),
                spaceBetweenInputFields,
                inputFields('District'),
                spaceBetweenInputFields,
                inputFields('Profile Picture'),
                spaceBetweenInputFields,
                MaterialButton(
                    child: Text("pick image"),
                    onPressed: () {
                      pickIMage();
                    }),
                image != null ? Image.file(image!) : Text('no image selected'),
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
