import 'package:ayu/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/doctor_profile.dart';

PreferredSize appBarComponent(
        pageTitle, appBarBg, textColor, iconColor, backgroundColor, context) =>
    PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              // onPressed: () {
              //   MaterialPageRoute(
              //     builder: (context) => const Profile(),
              //   );
              // },
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(100.0),
              //   child: Image.asset(
              //     'images/mee.jpg',
              //     fit: BoxFit.contain,
              //     height: 40.0,
              //     width: 40.0,
              //   ),
              // ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/mee.jpg'),
              ),
            ),
          ],
        ),
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(appBarBg), fit: BoxFit.fill),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      pageTitle,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

PreferredSize appBarDoctorComponent(
        pageTitle, appBarBg, textColor, iconColor, backgroundColor, context) =>
    PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(0),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              // onPressed: () {
              //   MaterialPageRoute(
              //     builder: (context) => const Profile(),
              //   );
              // },
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DoctorProfile()));
              },
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(100.0),
              //   child: Image.asset(
              //     'images/mee.jpg',
              //     fit: BoxFit.contain,
              //     height: 40.0,
              //     width: 40.0,
              //   ),
              // ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/mee.jpg'),
              ),
            ),
          ],
        ),
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(appBarBg), fit: BoxFit.fill),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      pageTitle,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
