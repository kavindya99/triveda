import 'package:ayu/pages/patient/buy_medicine/medicine_types.dart';
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

    final buttonText1 = 'Buy';
    final callFunction1 = MedicineTypes();
    final topPadding1 = 10.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar:
          appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
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
                      "images/buy-medicine.gif",
                      height: 229.0,
                      width: 298.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Buy Medicine',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You can search medicines from our online medicine shop',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'and buy them with your finger tips',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
