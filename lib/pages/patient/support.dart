import 'package:ayu/pages/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/pages/sign_up_patient.dart';
import 'package:ayu/styles/variables.dart';

class SupportPatient extends StatefulWidget {
  const SupportPatient({Key key}) : super(key: key);

  @override
  _SupportPatientState createState() => _SupportPatientState();
}

class _SupportPatientState extends State<SupportPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/appbar.png'), fit: BoxFit.fill),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(250),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        'SUPPORT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                spaceSignUpDoctor,
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
                spaceSignUpDoctor,
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
                spaceSignUpDoctor,
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      hintText: 'Subject',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
                spaceSignUpDoctor,
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
                spaceSignUpDoctor,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Send',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
