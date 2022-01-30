import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class BuyMedicine extends StatefulWidget {
  const BuyMedicine({Key key}) : super(key: key);

  @override
  _BuyMedicineState createState() => _BuyMedicineState();
}

class _BuyMedicineState extends State<BuyMedicine> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Buy Medicine";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar:
          appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
    );
  }
}
