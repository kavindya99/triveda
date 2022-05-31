import 'dart:convert';

import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../styles/customDialogBox.dart';
import '../../../styles/urlForAPI.dart';
import 'Cart.dart';
import 'package:http/http.dart' as http;

class Buy extends StatefulWidget {
  final int dataFromResponse;
  final String responseData;
  const Buy(this.dataFromResponse, this.responseData, {Key key})
      : super(key: key);

  @override
  _BuyState createState() => _BuyState(dataFromResponse, responseData);
}

class _BuyState extends State<Buy> {
  final int dataFromResponse;
  final String responseData;
  _BuyState(this.dataFromResponse, this.responseData);

  var feeData;

  Future<String> getFee() async {
    http.Response response;
    var url = Uri.parse(
        baseUrl + "/api/Medicines/getMediById/" + dataFromResponse.toString());

    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.body != null) {
      //print(url);
      //print(json.decode(response.body));
      var jsonData = json.decode(response.body);
      feeData = jsonData;
      print(jsonData);

      return response.body;
    } else {
      return "true";
    }

    //print(token);
  }

  TextEditingController _amount = TextEditingController();
  TextEditingController _deliveryAddress = TextEditingController();
  TextEditingController _contactNo = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  addItem(BuildContext context) async {
    var url = Uri.parse(baseUrl + 'api/Order');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = (prefs.getString('token') ?? '');
    print(prefs.getString('id'));
    Map data = {
      "quantity": _amount.text,
      "productId": dataFromResponse,
      "productName": responseData.toString(),
      "orderId": 0,
      "price": (feeData['pricePerUnit'] * int.parse(_amount.text)).toString()
    };
    var body = json.encode(data);
    print(url);
    print(data);
    var jsonResponse;
    try {
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      print(res.statusCode);

      if (res.statusCode == 400) {
        print(json.decode(res.body));
      }
      if (res.statusCode == 200) {
        jsonResponse = json.decode(res.body);
        showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
            title: "Success",
            description: "Successfully added the item",
          ),
        );
        Navigator.of(this.context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => Cart(),
            ),
            (Route<dynamic> route) => false);
        print("Response Status: ${res.statusCode}");

        if (jsonResponse != null) {}
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    //getFee();
    final pageTitle = "Add to Cart";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = 'Add';
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  spaceBetweenInputFields,
                  Text(
                    'You can select the amount you want from the selected medicine and add that to the cart.',
                    style: TextStyle(color: primaryColor, fontSize: 17.0),
                  ),
                  spaceBetweenInputFields,
                  inputFieldsReg(
                      'Amount', _amount, "Name can't be empty", false),
                  spaceBetweenInputFields,
                  FutureBuilder(
                      future: getFee(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            feeData != null) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Unit : ',
                                    style: TextStyle(
                                      color: secondaryColorOne,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    feeData["unit"],
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Price per Unit : ',
                                    style: TextStyle(
                                      color: secondaryColorOne,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    'LKR ' + feeData['pricePerUnit'].toString(),
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Unit : ',
                                  style: TextStyle(
                                    color: secondaryColorOne,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text("...",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price per Unit : ',
                                  style: TextStyle(
                                    color: secondaryColorOne,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text("LKR ...",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                          ],
                        );
                      }),
                  spaceBetweenInputFields,
                  FutureBuilder(
                      future: getFee(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Row(
                            children: [
                              Text(
                                'Price : ',
                                style: TextStyle(
                                  color: secondaryColorOne,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                              if (_amount.text.isEmpty)
                                Text(
                                  'No amount',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              else if (_amount.text.isNotEmpty)
                                Text(
                                  'LKR ' +
                                      (feeData['pricePerUnit'] *
                                              int.parse(_amount.text))
                                          .toString(),
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                            ],
                          );
                        }
                        return Row(
                          children: [
                            Text(
                              'Price : ',
                              style: TextStyle(
                                color: secondaryColorOne,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                            Text("LKR ...",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        );
                      }),
                  spaceBetweenInputFields,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: topPadding),
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: secondaryColorOne),
                      onPressed: () {
                        addItem(context);
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
