import 'package:ayu/pages/doctor/prescription/edit_prescription.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:flutter/material.dart';

import '../../../styles/appBar.dart';
import '../../../styles/variables.dart';

class AddedList extends StatefulWidget {
  const AddedList({Key key}) : super(key: key);

  @override
  _AddedListState createState() => _AddedListState();
}

class _AddedListState extends State<AddedList> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Prescriptions";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              spaceBetweenInputFields,
              Text(
                'All the prescriptions you added are listed here. If you need any modifications, you can edit the prescription.',
                style: TextStyle(color: primaryColor, fontSize: 17.0),
              ),
              spaceBetweenInputFields,
              Container(
                decoration: inputFieldDecoration,
                child: ExpansionTile(
                  title: Text(
                    'Prescription 1',
                    style: TextStyle(
                      color: secondaryColorOne,
                    ),
                  ),
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                'Patient Name : ',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: primaryColor,
                                  // fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(100.0, 0, 0, 20.0),
                            child: Container(
                              child: Text(
                                'Jeewandara Bandara',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(95, 141, 136, 1),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                'Date : ',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(95, 141, 136, 1),
                                  // fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(100.0, 0, 0, 20.0),
                            child: Container(
                              child: Text(
                                '2022.01.03.',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(95, 141, 136, 1),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                'Medicine : ',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: primaryColor,
                                  // fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                            child: DataTable(
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Name',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Amount',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        'Paanthi Paanthi Paanthi Paanthi Paanthi Paanthi Paanthi',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        '50',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        'Paanthi',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        '50',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: inputFieldDecoration,
                                  child: IconButton(
                                    onPressed: () {
                                      // pickIMage();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditPrescription()),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              spaceBetweenInputFields,
              Container(
                decoration: inputFieldDecoration,
                child: ExpansionTile(
                  title: Text(
                    'Prescription 2',
                    style: TextStyle(
                      color: secondaryColorOne,
                    ),
                  ),
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                'Patient Name : ',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: primaryColor,
                                  // fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(100.0, 0, 0, 20.0),
                            child: Container(
                              child: Text(
                                'Jeewandara Bandara',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(95, 141, 136, 1),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                'Date : ',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(95, 141, 136, 1),
                                  // fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(100.0, 0, 0, 20.0),
                            child: Container(
                              child: Text(
                                '2022.01.03.',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(95, 141, 136, 1),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Text(
                                'Medicine : ',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: primaryColor,
                                  // fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                            child: DataTable(
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Name',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Amount',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        'Paanthi Paanthi Paanthi Paanthi Paanthi Paanthi Paanthi',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        '50',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        'Paanthi',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        '50',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: inputFieldDecoration,
                                  child: IconButton(
                                    onPressed: () {
                                      // pickIMage();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditPrescription()),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
