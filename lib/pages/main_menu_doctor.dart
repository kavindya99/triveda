import 'package:ayu/pages/doctor/channeling_appointments/channeling_appointmnets.dart';
import 'package:ayu/pages/doctor/prescription/add_new_prescription.dart';
import 'package:ayu/pages/doctor/prescription/prescription.dart';
import 'package:ayu/pages/doctor/wallet/wallet.dart';
import 'package:ayu/pages/doctor/yoga_classes/yoga_classes.dart';
import 'package:ayu/pages/doctor/online_consultation/online_consultation.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
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
    final tileLink1 = OnlineConsultationDoctor();
    final tileText1 = 'Online \nConsultation';
    final tileLink2 = YogaClasses();
    final tileText2 = 'Yoga Classes';
    final tileLink3 = Prescription();
    final tileText3 = 'Prescription';
    final tileLink4 = Appointments();
    final tileText4 = 'Channeling Appointment';
    final tileLink5 = Wallet();
    final tileText5 = 'Wallet';
    final tileLink6 = AddNew();
    final tileText6 = 'Add Prescription';

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerDoctor(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/appbar-main.png'),
                  fit: BoxFit.fill),
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
                                color: whiteColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Jhon',
                            style: TextStyle(
                                color: whiteColor,
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
                mainMenuTile(context, tileLink1, tileText1),
                mainMenuTile(context, tileLink2, tileText2),
                mainMenuTile(context, tileLink3, tileText3),
                mainMenuTile(context, tileLink4, tileText4),
                mainMenuTile(context, tileLink5, tileText5),
                mainMenuTile(context, tileLink6, tileText6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
