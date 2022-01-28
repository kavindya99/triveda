import 'package:ayu/pages/forget_password.dart';
import 'package:ayu/pages/main_menu.dart';
import 'package:ayu/pages/reset_password.dart';
import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/pages/sign_up.dart';
import 'package:ayu/pages/sub_menus/channel_doctor/channel_doctor.dart';
import 'package:ayu/pages/sub_menus/check_symptoms/check_symptoms.dart';
import 'package:ayu/pages/sub_menus/doctor_profile.dart';
import 'package:ayu/pages/sub_menus/food_recipes/food_recipes.dart';
import 'package:ayu/pages/sub_menus/online_consultation/doctor_list.dart';
import 'package:ayu/pages/sub_menus/online_consultation/online_consultation.dart';
import 'package:ayu/pages/sub_menus/online_yoga_class/online_yoga_class.dart';
import 'package:ayu/pages/sub_menus/yoga_poses/yoga_poses.dart';
import 'package:flutter/material.dart';
import 'package:ayu/pages/loading_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color.fromRGBO(95, 141, 136, 1),
      fontFamily: 'Roboto',
    ),
    routes: {
      '/': (context) => Loading(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/forgetpassword': (context) => ForgetPassword(),
      '/resetpassword': (context) => ResetPassword(),
      '/mainmenu': (context) => MainMenu(),
      '/sub_menus/channeldoctor': (context) => ChannelDoctor(),
      '/sub_menus/checksymptoms': (context) => CheckSymptoms(),
      '/sub_menus/foodrecipes': (context) => FoodRecipes(),
      '/sub_menus/online_consultation/onlineconsultation': (context) =>
          OnlineConsultaion(),
      '/sub_menus/online_consultation/doctor_list.dart': (context) =>
          DoctorList(),
      '/sub_menus/onlineyoga': (context) => OnlineYogaClass(),
      '/sub_menus/yogaposes': (context) => YogaPoses(),
      '/sub_menus/': (context) => DoctorProfile(),
    },
  ));
}
