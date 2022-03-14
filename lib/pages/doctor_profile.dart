import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: whiteColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/profile-back.png'),
                  fit: BoxFit.fill),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            'Hi Jhon',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: Stack(
                            children: [
                              const CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage('images/mee.jpg'),
                              ),
                              Positioned(
                                  bottom: -10.0,
                                  child: Container(
                                    decoration: inputFieldDecoration,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        size: 30,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileTextMain('Role'),
                profileTextSub('Doctor'),
                spaceBetweenInputFields,
                profileTextMain('Personal'),
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  profileTextMain('Name'),
                                  profileTextSub('Jhon Walisara'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  profileTextMain('Gender'),
                                  profileTextSub('Female'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        spaceBetweenInputFields,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileTextMain('Email'),
                                profileTextSub('jhonwalisara@gmail.com'),
                              ],
                            ),
                          ],
                        ),
                        spaceBetweenInputFields,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileTextMain('Address'),
                                profileTextSub(
                                    '1st Lane, avenra road, Ratnapura'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                profileTextMain('Professional'),
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  profileTextMain('Doctor ID'),
                                  profileTextSub('12309874561E'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  profileTextMain('Hospital'),
                                  profileTextSub('New Town,Ratnapura'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        spaceBetweenInputFields,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileTextMain('Position'),
                                profileTextSub('Eye Specialist'),
                              ],
                            ),
                          ],
                        ),
                      ],
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
