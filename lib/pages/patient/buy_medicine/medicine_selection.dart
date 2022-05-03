import 'dart:convert';

import 'package:ayu/models/api.services.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import '../../../models/medicine.dart';
import 'medicine_details.dart';

class MedicineSelection extends StatefulWidget {
  const MedicineSelection({Key key}) : super(key: key);

  @override
  _MedicineSelectionState createState() => _MedicineSelectionState();
}

class _MedicineSelectionState extends State<MedicineSelection> {
  // List<Medicine> medicine;
  // getMedicine() {
  //   APIService.fetchMedicine().then(
  //     (response) {
  //       Iterable list = json.decode(response.body);
  //       List<Medicine> medicineList = List<Medicine>();
  //       medicineList = list.map((model) => Medicine.fromObject(model)).toList();
  //
  //       setState(
  //         () {
  //           medicine = medicineList;
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Medicine Selection";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = "Medicine's Name";
    final callFunction = Buy();
    final topPadding = 0.0;

    // getMedicine();
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Container(
            child: Column(
              children: [
                Text(
                  'You can search any medicine related to the category you selected in the previous page',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                inputFields('Search'),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                // medicine == null
                //     ? Center(
                //         child: Text('Empty'),
                //       )
                //     : ListView.builder(
                //         itemCount: medicine.length,
                //         itemBuilder: (context, index) {
                //           return Card(
                //             color: whiteColor,
                //             elevation: 2.0,
                //             child: ListTile(
                //               title: ListTile(
                //                 title: Text(medicine[index].name),
                //                 onTap: null,
                //               ),
                //             ),
                //           );
                //         },
                //       ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
