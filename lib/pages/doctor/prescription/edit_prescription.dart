import 'package:flutter/material.dart';

import '../../../styles/appBar.dart';
import '../../../styles/navigationDrawerDoctor.dart';
import '../../../styles/navigationDrawerPatient.dart';
import '../../../styles/variables.dart';
import 'added_prescriptions.dart';

class EditPrescription extends StatefulWidget {
  const EditPrescription({Key key}) : super(key: key);

  @override
  _EditPrescriptionState createState() => _EditPrescriptionState();
}

class _EditPrescriptionState extends State<EditPrescription> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Update Prescription";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update ';
    final callFunction = AddedList();
    final topPadding = 20.0;

    final items = [
      'Patient Name',
      'Patient Name1',
      'Patient Name2',
      'Patient Name3'
    ];
    String selectedValue = 'Patient Name';
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                Text(
                  'You can update the prescription. But, patients name is unable to change.',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                dropDownItems(selectedValue, setState, items),
                spaceBetweenInputFields,
                inputFields('Prescription'),
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
