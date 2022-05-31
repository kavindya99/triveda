import 'package:ayu/pages/payment.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

import 'medicine_selection.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController _deliveryAddress = TextEditingController();
  TextEditingController _contactNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Cart";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Proceed to Pay';
    final callFunction = Payment();
    final topPadding = 20.0;

    final buttonText1 = 'Back to List';
    final callFunction1 = MedicineSelection('');
    final topPadding1 = 0.0;

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
            child: Column(
              children: [
                spaceBetweenInputFields,
                Text(
                  'Items in your cart are displayed here. You can proceed to pay or continue shopping.',
                  style: TextStyle(color: primaryColor, fontSize: 17.0),
                ),
                spaceBetweenInputFields,
                listViewCart(
                    'Item 1', 'Nelli Kudu Nelli Kudu Nelli Kudu', '50', '150'),
                spaceBetweenInputFields,
                listViewCart(
                    'Item 3', 'Nelli Kudu Nelli Kudu Nelli Kudu', '50', '150'),
                spaceBetweenInputFields,
                listViewCart(
                    'Item 3', 'Nelli Kudu Nelli Kudu Nelli Kudu', '50', '150'),
                spaceBetweenInputFields,
                inputFieldsReg('Delivery Address', _deliveryAddress,
                    "Name can't be empty", false),
                spaceBetweenInputFields,
                inputFieldsReg(
                    'Contact No', _contactNo, "Name can't be empty", false),
                buttonInPages(buttonText, context, callFunction, topPadding),
                buttonInPages(buttonText1, context, callFunction1, topPadding1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
