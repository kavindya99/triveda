import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/pages/patient/buy_medicine/buy_medicine.dart';
import 'package:ayu/pages/patient/channel_doctor/channel_doctor.dart';
import 'package:ayu/pages/patient/check_symptoms/check_symptoms.dart';
import 'package:ayu/pages/patient/doctor_list.dart';
import 'package:ayu/pages/patient/food_recipes/food_recipes.dart';
import 'package:ayu/pages/patient/online_consultation/online_consultation.dart';
import 'package:ayu/pages/patient/prescriptions.dart';
import 'package:ayu/pages/patient/service_appointments.dart';
import 'package:ayu/pages/patient/support.dart';
import 'package:ayu/pages/patient/yoga/yoga.dart';
import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool get isCollapsed => null;

  @override
  Widget build(BuildContext context) {
    final isCollpased = true;
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 5.0);

    return Container(
      width: isCollpased ? MediaQuery.of(context).size.width * 0.8 : null,
      child: Container(
        color: primaryColor,
        child: Column(
          children: [
            Container(
              padding: safeArea,
              child: buildHeader(isCollapsed),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 200.0,
                decoration: new BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    navigationDrawer(
                        context, OnlineConsultaion(), 'Online Consultation'),
                    navigationDrawer(
                        context, CheckSymptoms(), 'Check Symptoms'),
                    navigationDrawer(
                        context, ChannelDoctor(), 'Channel a Doctor'),
                    navigationDrawer(context, BuyMedicine(), 'Buy Medicine'),
                    navigationDrawer(context, Prescriptions(), 'Prescriptions'),
                    navigationDrawer(context, FoodRecipes(), 'Food Recipes'),
                    navigationDrawer(context, Yoga(), 'Yoga'),
                    navigationDrawer(
                        context, BookedAppointments(), 'Appointment List'),
                    navigationDrawer(context, DoctorList(), 'Doctor Search'),
                    navigationDrawer(context, SupportPatient(), 'Support'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: whiteColor,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn(
                                          key: null,
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/logout.webp'),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
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
    );
  }

  // Widget buildList({
  //   required bool isCollapsed,
  //   required List<DrawerItem> items,
  // }) =>
  //     ListView.builder(
  //       itemBuilder: (context, index){
  //       final item = items[index];
  //       return buillMenuItem();
  //     },
  //     );

  Widget buildHeader(bool isCollpased) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CloseButton(
            color: whiteColor,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainMenu()));
            },
            child: Container(
              child: Expanded(
                child: Image.asset(
                  'images/logo-app.webp',
                  width: 40.0,
                ),
              ),
            ),
          ),
        ],
      );
}
