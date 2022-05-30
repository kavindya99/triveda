import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pages/meeting_start.dart';

Color primaryColor = Color.fromRGBO(95, 141, 136, 1.0);
// Color primaryColor = Color.fromRGBO(29, 49, 72, 1);
Color secondaryColorOne = Color.fromRGBO(174, 182, 142, 1);
Color secondaryColorTwo = Color.fromRGBO(186, 198, 184, 1);
Color secondaryColorThree = Color.fromRGBO(215, 218, 180, 1);
Color errorColor = Color.fromRGBO(208, 72, 72, 1);
Color whiteColor = Colors.white;

Color shadowColor = Color.fromRGBO(0, 0, 0, 0.25);
Shadow letterShadow = Shadow(
  blurRadius: 4.0,
  color: shadowColor,
  offset: Offset(1.0, 1.0),
);

Shadow boxShadow = BoxShadow(
  color: shadowColor,
  spreadRadius: 0,
  blurRadius: 4,
  offset: Offset(1.0, 2.0), // changes position of shadow
);

BoxDecoration inputFieldDecoration = BoxDecoration(
  color: whiteColor,
  borderRadius: new BorderRadius.circular(5.0),
  boxShadow: [
    boxShadow,
  ],
);

SizedBox spaceBetweenInputFields = SizedBox(
  height: 30.0,
);

SizedBox spaceCollapseMenu = SizedBox(
  height: 30.0,
);

SizedBox spaceInRecipe = SizedBox(
  height: 3.0,
);

Container inputFieldsReg(hint, controllerField, emptyMessage, showHide) =>
    Container(
      decoration: inputFieldDecoration,
      child: TextFormField(
        obscureText: showHide,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.all(10.0),
          fillColor: whiteColor,
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: TextStyle(
            color: secondaryColorOne,
          ),
        ),
        controller: controllerField,
        validator: (String value) {
          if (value.isEmpty) {
            return emptyMessage;
          }
          return null;
        },
      ),
    );

Container inputFields(hint) => Container(
      decoration: inputFieldDecoration,
      child: TextFormField(
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.all(10.0),
          fillColor: whiteColor,
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.0),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: TextStyle(
            color: secondaryColorOne,
          ),
        ),
      ),
    );

Container buttonInPages(buttonText, context, callFunction, topPadding) =>
    Container(
      padding: EdgeInsets.symmetric(vertical: topPadding),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: secondaryColorOne),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => callFunction));
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
    );

Container buttonInMainPages(buttonText, context, callFunction, topPadding) =>
    Container(
      padding: EdgeInsets.symmetric(vertical: topPadding),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: secondaryColorOne),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => callFunction));
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
    );

Container listView(buttonText, context, callFunction, topPadding) => Container(
      padding: EdgeInsets.symmetric(vertical: topPadding),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: primaryColor),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => callFunction));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
    );

ElevatedButton mainMenuTile(context, tileLink, tileText) => ElevatedButton(
      style: ElevatedButton.styleFrom(primary: secondaryColorOne),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => tileLink));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
          child: Text(
            tileText,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                shadows: [
                  letterShadow,
                ],
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );

Row profileTextMain(text) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Text(
            text,
            style: TextStyle(
              color: secondaryColorOne,
              fontWeight: FontWeight.w700,
              fontSize: 21.0,
              // shadows: <Shadow>[
              //   letterShadow,
              // ],
            ),
          ),
        ),
      ],
    );

Container profileTextSub(text) => Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: primaryColor,
          shadows: <Shadow>[
            letterShadow,
          ],
        ),
      ),
    );

Container listViewCart(mainText, medicine, amount, price) => Container(
      decoration: inputFieldDecoration,
      child: ExpansionTile(
        title: Text(
          mainText,
          style: TextStyle(
            color: secondaryColorOne,
          ),
        ),
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
              image: new DecorationImage(
                image: ExactAssetImage('images/light-bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Medicine",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          medicine,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Amount",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          amount,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Price",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          price,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Column listViewOnlineConsult(mainText, name, type, date, time) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Patient Name",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Type",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  type,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Date",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  date,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Time",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );

Container listViewChannelAppointments(mainText, name, type, date, time) =>
    Container(
      decoration: inputFieldDecoration,
      child: ExpansionTile(
        title: Text(
          mainText,
          style: TextStyle(
            color: secondaryColorOne,
          ),
        ),
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
              image: new DecorationImage(
                image: ExactAssetImage('images/light-bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Patient Name",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Type",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          type,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Date",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          date,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Time",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          time,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: secondaryColorThree),
                      onPressed: () {
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => callFunction));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Completed',
                          style: TextStyle(
                              color: whiteColor,
                              shadows: [
                                letterShadow,
                              ],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Column listViewYoga(mainText, name, date, time) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Patient Name",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Date",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  date,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Time",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );

Container listViewWallet(mainText, fee) => Container(
      decoration: inputFieldDecoration,
      child: ExpansionTile(
        title: Text(
          mainText,
          style: TextStyle(
            color: secondaryColorOne,
          ),
        ),
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
              image: new DecorationImage(
                image: ExactAssetImage('images/light-bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 30, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Amount",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          fee,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

// Container dropDownItems(selectedValue, setState, itemsList) => Container(
//       decoration: inputFieldDecoration,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
//         child: DropdownButton<String>(
//           style: TextStyle(color: secondaryColorOne),
//           isExpanded: true,
//           value: selectedValue,
//           onChanged: (String newValue) =>
//               setState(() => selectedValue = newValue),
//           items: itemsList
//               .map<DropdownMenuItem<String>>(
//                   (String value) => DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       ))
//               .toList(),
//           // add extra sugar..
//           icon: Icon(
//             Icons.arrow_drop_down,
//             color: primaryColor,
//           ),
//           underline: SizedBox(),
//         ),
//       ),
//     );
Container dropDownItems(selectedValue, setState, itemsList) => Container(
    decoration: inputFieldDecoration,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: DropdownButton<String>(
        style: TextStyle(
          color: secondaryColorOne,
          fontSize: 16.0,
        ),
        isExpanded: true,
        value: selectedValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        underline: SizedBox(),
        onChanged: (String newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: itemsList.map<DropdownMenuItem<String>>((String value1) {
          return DropdownMenuItem<String>(
            value: value1,
            child: Text(value1),
          );
        }).toList(),
      ),
    ));

Column navigationDrawer(context, function, text) => Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: whiteColor,
            elevation: 0,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => function));
          },
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(color: primaryColor, fontSize: 16.0),
              )
            ],
          ),
        ),
      ],
    );
