import 'package:ayu/pages/doctor/channeling_appointments/channeling_appointments_list.dart';
import 'package:ayu/pages/doctor/channeling_appointments/channeling_appointmnets.dart';
import 'package:ayu/pages/doctor/online_consultation/patient_list.dart';
import 'package:ayu/pages/doctor/prescription/add_new_prescription.dart';
import 'package:ayu/pages/doctor/prescription/added_prescriptions.dart';
import 'package:ayu/pages/doctor/prescription/edit_prescription.dart';
import 'package:ayu/pages/doctor/prescription/prescription.dart';
import 'package:ayu/pages/doctor/wallet/channel_appointment_wallet.dart';
import 'package:ayu/pages/doctor/wallet/online_consultation_wallet.dart';
import 'package:ayu/pages/doctor/wallet/wallet.dart';
import 'package:ayu/pages/doctor/wallet/yoga_class_wallet.dart';
import 'package:ayu/pages/doctor/yoga_classes/class_list.dart';
import 'package:ayu/pages/doctor/yoga_classes/yoga_classes.dart';
import 'package:ayu/pages/forget_password.dart';
import 'package:ayu/pages/main_menu_doctor.dart';
import 'package:ayu/pages/main_menu_patient.dart';
import 'package:ayu/pages/patient/channel_doctor/channel_doctor.dart';
import 'package:ayu/pages/patient/check_symptoms/check_symptoms.dart';
import 'package:ayu/pages/patient/check_symptoms/search_disease.dart';
import 'package:ayu/pages/patient/check_symptoms/search_result.dart';
import 'package:ayu/pages/patient/food_recipes/food_recipes.dart';
import 'package:ayu/pages/patient/doctor_list.dart';
import 'package:ayu/pages/patient/online_consultation/consult_a_doctor.dart';
import 'package:ayu/pages/patient/online_consultation/online_consultation.dart';
import 'package:ayu/pages/doctor/online_consultation/online_consultation.dart';
import 'package:ayu/pages/patient/yoga/online_yoga_class.dart';
import 'package:ayu/pages/patient/yoga/yoga.dart';
import 'package:ayu/pages/payment.dart';
import 'package:ayu/pages/profile.dart';
import 'package:ayu/pages/reset_password.dart';
import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/pages/sign_up_doctor.dart';
import 'package:ayu/pages/sign_up_patient.dart';
import 'package:ayu/pages/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:ayu/pages/loading_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(95, 141, 136, 1),
      fontFamily: 'Roboto',
    ),
    routes: {
      '/': (context) => Loading(),
      '/signin': (context) => SignIn(
            key: null,
          ),
      '/signuppatient': (context) => SignUp(
            key: null,
          ),
      '/signupdoctor': (context) => SignUpDoctor(
            key: null,
          ),
      '/forgetpassword': (context) => ForgetPassword(),
      '/resetpassword': (context) => ResetPassword(),
      '/payment': (context) => Payment(),
      '/profile': (context) => Profile(),
      '/mainmenu-patient': (context) => MainMenu(),
      '/sub_menus/channeldoctor': (context) => ChannelDoctor(),
      '/sub_menus/checksymptoms': (context) => CheckSymptoms(),
      '/sub_menus/checksymptoms/searchdisease': (context) => SearchDisease(),
      '/sub_menus/checksymptoms/searchdisease/searchresult': (context) =>
          SearchResult(),
      '/sub_menus/foodrecipes': (context) => FoodRecipes(),
      '/sub_menus/online_consultation/onlineconsultation': (context) =>
          OnlineConsultaion(),
      '/sub_menus/online_consultation/doctor_list.dart': (context) =>
          DoctorList(),
      '/sub_menus/online_consultation/consult_a_doctor.dart': (context) =>
          ConsultADoctor(),
      '/sub_menus/onlineyoga': (context) => OnlineYogaClass(),
      '/sub_menus/yogaposes': (context) => Yoga(),
      /*
      ///
      /////doctor routes
      ///
      */
      '/mainmenu-doctor': (context) => MainMenuDoctor(),
      '/sub_menus/online_consultation/onlineConsultation': (context) =>
          OnlineConsultationDoctor(),
      '/sub_menus/online_consultation/onlineConsultationList': (context) =>
          PatientList(),
      '/sub_menus/': (context) => DoctorProfile(),
      '/sub_menus/channel_appointments/channelAppointments': (context) =>
          Appointments(),
      '/sub_menus/channel_appointments/channelAppointmentsList': (context) =>
          AppointmentList(),
      '/sub_menus/prescription/prescription': (context) => Prescription(),
      '/sub_menus/prescription/editPrescription': (context) =>
          EditPrescription(),
      '/sub_menus/prescription/addPrescription': (context) => AddNew(),
      '/sub_menus/prescription/addedPrescription': (context) => AddedList(),
      '/sub_menus/wallet/wallet': (context) => Wallet(),
      '/sub_menus/wallet/channel_wallet': (context) =>
          ChannelAppointmentWallet(),
      '/sub_menus/wallet/online_wallet': (context) =>
          OnlineConsultationWallet(),
      '/sub_menus/wallet/yoga_wallet': (context) => YogaClassWallet(),
      '/sub_menus/yoga_classes/yoga_class': (context) => YogaClasses(),
      '/sub_menus/yoga_classes/class_list': (context) => ClassList(),
    },
  ));
}
