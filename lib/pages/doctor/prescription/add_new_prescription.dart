import 'package:ayu/pages/doctor/prescription/prescription.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  // QuillController _controller = QuillController.basic();
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
                spaceBetweenInputFields,
                Text(
                  'You can add prescription to the patients. First write the name of the medicine,then write the amount next by separating name and amount with a \' : \' mark.',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                dropDownItems(selectedValue, setState, items),
                spaceBetweenInputFields,
                inputFields('Prescription'),
                // QuillToolbar.basic(controller: _controller),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Container(
                //       decoration: inputFieldDecoration,
                //       height: 300.0,
                //       child: QuillEditor.basic(
                //         controller: _controller,
                //         readOnly: false, // change to true to be view only mode
                //       ),
                //     ),
                //   ),
                // ),
                // ZefyrScaffold(
                //   child: ZefyrEditor(
                //     padding: EdgeInsets.all(20.0),
                //     controller: _controller,
                //     focusNode: _focusNode,
                //   ),
                // ),
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
