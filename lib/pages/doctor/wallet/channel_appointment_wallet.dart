import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class ChannelAppointmentWallet extends StatefulWidget {
  const ChannelAppointmentWallet({Key key}) : super(key: key);

  @override
  _ChannelAppointmentWalletState createState() =>
      _ChannelAppointmentWalletState();
}

class _ChannelAppointmentWalletState extends State<ChannelAppointmentWallet> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Channel Appointment \nWallet";
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
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                spaceBetweenInputFields,
                Text(
                  'All the payments which you are not received yet from channeling appointments are displayed here.',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17.0,
                  ),
                ),
                spaceBetweenInputFields,
                listViewWallet('Appointment 1', '1200'),
                spaceBetweenInputFields,
                listViewWallet('Appointment 2', '1200'),
                spaceBetweenInputFields,
                listViewWallet('Appointment 3', '1200'),
                spaceBetweenInputFields,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
