import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerDoctor.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class YogaClassWallet extends StatefulWidget {
  const YogaClassWallet({Key key}) : super(key: key);

  @override
  _YogaClassWalletState createState() => _YogaClassWalletState();
}

class _YogaClassWalletState extends State<YogaClassWallet> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Yoga Class \nWallet";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/sub-back.png"),
                  fit: BoxFit.fitHeight),
            ),
            child: Column(
              children: [
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
