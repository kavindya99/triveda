import 'package:ayu/pages/doctor/wallet/account_details.dart';
import 'package:ayu/pages/doctor/wallet/wallet.dart';
import 'package:flutter/material.dart';

import '../../../styles/appBar.dart';
import '../../../styles/navigationDrawerDoctor.dart';
import '../../../styles/variables.dart';

class EditBankDetails extends StatefulWidget {
  const EditBankDetails({Key key}) : super(key: key);

  @override
  _EditBankDetailsState createState() => _EditBankDetailsState();
}

class _EditBankDetailsState extends State<EditBankDetails> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Bank Details";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add';
    final callFunction = AccountDetails();
    final topPadding = 20.0;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
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
                inputFields('Name'),
                spaceBetweenInputFields,
                inputFields('Account Number'),
                spaceBetweenInputFields,
                inputFields('Branch'),
                spaceBetweenInputFields,
                inputFields('Bank'),
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
