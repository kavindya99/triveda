import 'package:ayu/pages/doctor/wallet/account_details.dart';
import 'package:ayu/pages/doctor/wallet/channel_appointment_wallet.dart';
import 'package:ayu/pages/doctor/wallet/online_consultation_wallet.dart';
import 'package:ayu/pages/doctor/wallet/yoga_class_wallet.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Wallet";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;

    final buttonText1 = 'Online Consultation';
    final callFunction1 = OnlineConsultationWallet();
    final topPadding1 = 10.0;

    final buttonText2 = 'Channel Appointments';
    final callFunction2 = ChannelAppointmentWallet();
    final topPadding2 = 10.0;

    final buttonText3 = 'Yoga Class';
    final callFunction3 = YogaClassWallet();
    final topPadding3 = 10.0;

    final buttonText4 = 'Bank Details';
    final callFunction4 = AccountDetails();
    final topPadding4 = 10.0;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/money.gif",
                      height: 229.0,
                      width: 298.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Checking the wallet whether the payments are done',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                spaceBetweenInputFields,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText1, context, callFunction1, topPadding1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText2, context, callFunction2, topPadding2),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText3, context, callFunction3, topPadding3),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: buttonInPages(
                          buttonText4, context, callFunction4, topPadding4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
