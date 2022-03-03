import 'package:ayu/pages/forget_password.dart';
import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/pages/patient/channel_doctor/channel_doctor.dart';
import 'package:ayu/pages/patient/check_symptoms/check_symptoms.dart';
import 'package:ayu/pages/patient/food_recipes/food_recipes.dart';
import 'package:ayu/pages/patient/doctor_list.dart';
import 'package:ayu/pages/patient/online_consultation/consult_a_doctor.dart';
import 'package:ayu/pages/patient/online_consultation/online_consultation.dart';
import 'package:ayu/pages/patient/yoga/online_yoga_class.dart';
import 'package:ayu/pages/patient/yoga/yoga.dart';
import 'package:ayu/pages/reset_password.dart';
import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/pages/sign_up_doctor.dart';
import 'package:ayu/pages/sign_up_patient.dart';
import 'package:ayu/pages/doctor_profile.dart';
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
      '/signuppatient': (context) => SignUp(),
      '/signupdoctor': (context) => SignUpDoctor(),
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
      '/sub_menus/online_consultation/consult_a_doctor.dart': (context) =>
          ConsultADoctor(),
      '/sub_menus/onlineyoga': (context) => OnlineYogaClass(),
      '/sub_menus/yogaposes': (context) => Yoga(),
      '/sub_menus/': (context) => DoctorProfile(),
    },
  ));
}
