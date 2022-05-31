import 'dart:convert';
import 'dart:io';

import 'package:ayu/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/appBar.dart';
import '../../styles/customDialogBox.dart';
import '../../styles/navigationDrawerPatient.dart';
import '../../styles/urlForAPI.dart';
import '../../styles/variables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../lists_for.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File image;
  String district = 'Colombo';
  String province = 'Central Province';

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

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  updateProfile(BuildContext context) async {
    var url = Uri.parse(baseUrl + '/auth/patient-profile-edit');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    Map data = {
      "name": _name.text,
      "email": _email.text,
      "phoneNumber": _phoneNo.text,
      "district": district,
      "province": province,
    };
    var body = json.encode(data);
    print(url);
    print(data);
    var jsonResponse;
    try {
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print(res.statusCode);

      if (res.statusCode == 400) {
        print(json.decode(res.body));
      }
      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Success",
            description: "Successfully updated the profile",
          ),
        );
        Navigator.of(this.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => Profile(),
            ),
            (Route<dynamic> route) => false);
        _name.clear();
        _email.clear();
        // _currentPassword.clear();
        print("Response Status: ${res.statusCode}");

        if (jsonResponse != null) {}
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Edit Profile";
    final appBarBg = 'images/appbar-dark.webp';
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Enter new values to the fields which you need to update in your profile details',
                    style: TextStyle(color: primaryColor, fontSize: 17.0),
                  ),
                  spaceBetweenInputFields,
                  inputFieldsReg('Name', _name, "Name can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg(
                      'Email', _email, "Email can't be empty", false),
                  spaceBetweenInputFields,
                  inputFieldsReg('Phone Number', _phoneNo,
                      "Phone Number can't be empty", false),
                  // spaceBetweenInputFields,
                  // inputFields('Password'),
                  spaceBetweenInputFields,
                  Container(
                    decoration: inputFieldDecoration,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: DropdownButton<String>(
                        style: TextStyle(
                          color: secondaryColorOne,
                          fontSize: 16.0,
                        ),
                        isExpanded: true,
                        value: district,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            district = newValue;
                          });
                        },
                        items: districts
                            .map<DropdownMenuItem<String>>((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  spaceBetweenInputFields,
                  //dropDownItems(province, setState, provinces),
                  Container(
                    decoration: inputFieldDecoration,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: DropdownButton<String>(
                        style: TextStyle(
                          color: secondaryColorOne,
                          fontSize: 16.0,
                        ),
                        isExpanded: true,
                        value: province,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            province = newValue;
                          });
                        },
                        items: provinces
                            .map<DropdownMenuItem<String>>((String value1) {
                          return DropdownMenuItem<String>(
                            value: value1,
                            child: Text(value1),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  spaceBetweenInputFields,
                  //image upload
                  // MaterialButton(
                  //     child: Container(
                  //       decoration: inputFieldDecoration,
                  //       width: double.infinity,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(15.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               'Profile Picture',
                  //               style: TextStyle(
                  //                   color: secondaryColorOne,
                  //                   fontSize: 16.0,
                  //                   fontWeight: FontWeight.w400),
                  //             ),
                  //             Icon(
                  //               // <-- Icon
                  //               Icons.image,
                  //               size: 24.0,
                  //               color: secondaryColorTwo,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       pickIMage();
                  //     }),
                  // spaceBetweenInputFields,
                  // AspectRatio(
                  //   aspectRatio: 451 / 451,
                  //   child: Container(
                  //     child: image != null
                  //         ? Image.file(
                  //             image,
                  //             fit: BoxFit.fitWidth,
                  //             alignment: FractionalOffset.center,
                  //           )
                  //         : Text(''),
                  //   ),
                  // ),
                  // buttonInPages(
                  //     buttonText, context, updateProfile(context), topPadding),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: topPadding),
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: secondaryColorOne),
                      onPressed: () {
                        updateProfile(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          buttonText,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              shadows: [
                                letterShadow,
                              ],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
