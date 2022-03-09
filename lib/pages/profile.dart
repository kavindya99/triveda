import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: AppBar(
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
                                        color: Colors.lime,
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
                profileTextSub('Patient'),
                spaceBetweenInputFields,
                profileTextMain('Info'),
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileTextMain('Name'),
                                profileTextSub('Jhon Walisara'),
                              ],
                            ),
                          ],
                        ),
                        spaceBetweenInputFields,
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  profileTextMain('District'),
                                  profileTextSub('Ratnapura'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  profileTextMain('Province'),
                                  profileTextSub('Sabaragamuwa'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                profileTextMain('Contact Info'),
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileTextMain('Contact No'),
                                profileTextSub('070 3532119'),
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
                                profileTextMain('Email'),
                                profileTextSub('jhonwalisara@gmail.com'),
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
