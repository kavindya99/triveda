import 'package:ayu/pages/doctor/wallet/wallet.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import 'Edit_details.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Bank Details";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add';
    final callFunction = Wallet();
    final topPadding = 20.0;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawerDoctor(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorThree),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditBankDetails()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      child: Icon(
                        Icons.edit,
                        color: primaryColor,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Name : ',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: primaryColor,
                              // fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Account Number : ',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(95, 141, 136, 1),
                              // fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '199980712150',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(95, 141, 136, 1),
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Branch : ',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: primaryColor,
                              // fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Newtown',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(95, 141, 136, 1),
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Bank : ',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: primaryColor,
                              // fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Ratnapura',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(95, 141, 136, 1),
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
