import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../styles/appBar.dart';
import '../../../styles/customDialogBox.dart';
import '../../../styles/navigationDrawerDoctor.dart';
import '../../../styles/urlForAPI.dart';
import '../../../styles/variables.dart';
import 'account_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddBankDetails extends StatefulWidget {
  const AddBankDetails({Key key}) : super(key: key);

  @override
  _AddBankDetailsState createState() => _AddBankDetailsState();
}

class _AddBankDetailsState extends State<AddBankDetails> {
  TextEditingController _name = TextEditingController();
  TextEditingController _accountNo = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _bank = TextEditingController();

  Map userDetails;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var response;
  var getRes;

  addBankDetails(
      String name, String accountNo, String branch, String bank) async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    String id = (prefs.getString('id') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'api/DoctorPayments');

    //print((prefs.getString('id') ?? ''));
    //print(prefs.getString('id') ?? '');
    //print(token);

    Map<String, dynamic> data = {
      "accountNo": accountNo,
      "accountName": name,
      "branch": branch,
      "bankName": bank,
    };

    //print(data);
    //print(data);
    var body = json.encode(data);
    print(body);

    response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body);

    //var res = json.encode(response.body);
    //print(res);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      print("Response Status: ${response.statusCode}");
      showDialog(
        context: this.context,
        builder: (context) => CustomDialog(
          title: "Success",
          description: "You successfully added the prescription.",
        ),
      );
      Navigator.of(this.context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => AccountDetails(),
          ),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Add Bank Details";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add';
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Add your bank account details which are visible only to the Admin ',
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
                  //buttonInPages(buttonText, context, callFunction, topPadding),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: topPadding),
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: secondaryColorOne),
                      onPressed: () {
                        addBankDetails(_name.text, _accountNo.text,
                            _branch.text, _bank.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          buttonText,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              shadows: [
                                letterShadow,
                              ],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
