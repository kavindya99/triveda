import 'package:ayu/pages/patient/channel_doctor/channel_doctor.dart';
import 'package:ayu/pages/patient/check_symptoms/check_symptoms.dart';
import 'package:ayu/pages/patient/food_recipes/food_recipes.dart';
import 'package:ayu/pages/patient/doctor_list.dart';
import 'package:ayu/pages/patient/yoga/online_yoga_class.dart';
import 'package:ayu/pages/patient/yoga/yoga.dart';
import 'package:flutter/material.dart';
import 'package:ayu/styles/variables.dart';

class MainMenuDoctor extends StatefulWidget {
  const MainMenuDoctor({Key key}) : super(key: key);

  @override
  _MainMenuDoctorState createState() => _MainMenuDoctorState();
}

class _MainMenuDoctorState extends State<MainMenuDoctor> {
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Jhon',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
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
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(30),
            sliver: SliverGrid.count(
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DoctorList()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                    child: Center(
                      child: Text(
                        'Online \nConsultation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            shadows: [
                              letterShadow,
                            ],
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnlineYogaClass()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                    child: Text(
                      'Online Yoga\nClass',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckSymptoms()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                    child: Center(
                      child: Text(
                        'Check \nSymptoms',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            shadows: [
                              letterShadow,
                            ],
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChannelDoctor()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                    child: Text(
                      'Channel a\nDoctor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodRecipes()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                    child: Center(
                      child: Text(
                        'Food \nRecipes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            shadows: [
                              letterShadow,
                            ],
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Yoga()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                    child: Text(
                      'Yoga \nPoses',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
