import 'package:ayu/pages/doctor/wallet/account_details.dart';
import 'package:ayu/pages/doctor/wallet/wallet.dart';
import 'package:ayu/styles/urlForAPI.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../styles/appBar.dart';
import '../../../styles/customDialogBox.dart';
import '../../../styles/navigationDrawerDoctor.dart';
import '../../../styles/variables.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditBankDetails extends StatefulWidget {
  const EditBankDetails({Key key}) : super(key: key);

  @override
  _EditBankDetailsState createState() => _EditBankDetailsState();
}

class _EditBankDetailsState extends State<EditBankDetails> {
  TextEditingController _name = TextEditingController();
  TextEditingController _accountNo = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _bank = TextEditingController();

  updateAccountDetails() async {
    var url = Uri.parse("$baseUrl/user/");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    Map<String, dynamic> data = {
      "accountNo": _accountNo.text,
      "accountName": _name.text,
      "branch": _branch.text,
      "bankName": _bank.text,
    };
    var body = json.encode(data);

    var jsonResponse;
    try {
      var res = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print(res.statusCode);
      if (res.statusCode == 400) {
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Success",
            description: "You successfully added the prescription.",
          ),
        );
      }
      if (res.statusCode == 200) {
        print(json.decode(body));
        _name.clear();
        _accountNo.clear();
        _bank.clear();
        _branch.clear();
        ;
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Success",
            description: "You successfully added the prescription.",
          ),
        );

        if (jsonResponse != null) {}
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Update Bank Details";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Update';
    final callFunction = AccountDetails();
    final topPadding = 20.0;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarDoctorComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30.0, right: 30.0),
          child: Container(
            child: Column(
              children: [
                Text(
                  'Update your bank account details which are visible to the Admin ',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                inputFieldsReg(
                    'Name', _name, "Prescription can't be empty", false),
                spaceBetweenInputFields,
                inputFieldsReg('Account Number', _accountNo,
                    "Prescription can't be empty", false),
                spaceBetweenInputFields,
                inputFieldsReg(
                    'Branch', _branch, "Prescription can't be empty", false),
                spaceBetweenInputFields,
                inputFieldsReg(
                    'Bank', _bank, "Prescription can't be empty", false),
                spaceBetweenInputFields,
                buttonInPages(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
