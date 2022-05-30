import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';

class Buy extends StatefulWidget {
  const Buy({Key key}) : super(key: key);

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  String dropdownValue1 = 'Amount';
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Add to Cart";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add';
    final callFunction = Cart();
    final topPadding = 20.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                spaceBetweenInputFields,
                Text(
                  'You can select the amount you want from the selected medicine and add that to the cart.',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                Container(
                  decoration: inputFieldDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: secondaryColorOne,
                        fontSize: 16.0,
                      ),
                      isExpanded: true,
                      value: dropdownValue1,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      underline: SizedBox(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue1 = newValue;
                        });
                      },
                      items: <String>['Amount', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                spaceBetweenInputFields,
                inputFields('Delivery Address'),
                spaceBetweenInputFields,
                inputFields('Fee'),
                spaceBetweenInputFields,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: buttonInPages(
                      buttonText, context, callFunction, topPadding),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
