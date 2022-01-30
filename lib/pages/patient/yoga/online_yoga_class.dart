import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/navigationDrawer.dart';

class OnlineYogaClass extends StatefulWidget {
  const OnlineYogaClass({Key key}) : super(key: key);

  @override
  _OnlineYogaClassState createState() => _OnlineYogaClassState();
}

class _OnlineYogaClassState extends State<OnlineYogaClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          iconTheme: IconThemeData(color: secondaryColorOne),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'images/profile-image.png',
                fit: BoxFit.contain,
                height: 40.0,
                width: 40.0,
              ),
            ],
          ),
          shadowColor: Colors.transparent,
          backgroundColor: primaryColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/sub.png'), fit: BoxFit.fill),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/menuIcon.png"),
                        fit: BoxFit.contain),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        'Online Consultation',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
