import 'package:ayu/pages/doctor_profile.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key key}) : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Doctor List";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar:
          appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search Doctors',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Click on doctor’s name to book an appointment for online consultation and also you can get their details',
                  style: TextStyle(
                      fontSize: 16.00, color: Color.fromRGBO(93, 131, 99, 1)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(66),
                    primary: Color.fromRGBO(93, 131, 99, 1), // NEW
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorProfile()));
                  },
                  child: const Text(
                    'Dr. Jhon Eric',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(66),
                      primary: Color.fromRGBO(93, 131, 99, 1) // NEW
                      ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorProfile()));
                  },
                  child: const Text(
                    'Dr. Jhon Eric',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(66),
                      primary: Color.fromRGBO(93, 131, 99, 1) // NEW
                      ),
                  onPressed: () {},
                  child: const Text(
                    'Dr. Jhon Eric',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(66),
                      primary: Color.fromRGBO(93, 131, 99, 1) // NEW
                      ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorProfile()));
                  },
                  child: const Text(
                    'Dr. Jhon Eric',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(66),
                      primary: Color.fromRGBO(93, 131, 99, 1) // NEW
                      ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorProfile()));
                  },
                  child: const Text(
                    'Dr. Jhon Eric',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(66),
                      primary: Color.fromRGBO(93, 131, 99, 1) // NEW
                      ),
                  onPressed: () {},
                  child: const Text(
                    'Dr. Jhon Eric',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(66),
                      primary: Color.fromRGBO(93, 131, 99, 1) // NEW
                      ),
                  onPressed: () {},
                  child: const Text(
                    'Dr. Jhon Eric',
                    style: TextStyle(fontSize: 20),
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
