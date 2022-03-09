import 'package:ayu/pages/doctor/prescription/prescription.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  // ZefyrController _controller;
  //
  // FocusNode _focusNode;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   final document = _loadDocument();
  //   _controller = ZefyrController(document);
  //   _focusNode = FocusNode();
  // }
  //
  // NotusDocument _loadDocument() {
  //   final Delta delta = Delta()..insert("Start");
  //   return NotusDocument.fromDelta(delta);
  // }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Add Prescription";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add ';
    final callFunction = Prescription();
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
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                spaceBetweenInputFields,
                dropDownItems(selectedValue, setState, items),
                spaceBetweenInputFields,
                inputFields('Prescription'),
                // ZefyrScaffold(
                //   child: ZefyrEditor(
                //     padding: EdgeInsets.all(20.0),
                //     controller: _controller,
                //     focusNode: _focusNode,
                //   ),
                // ),
                // buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
