import 'dart:ui';

import 'package:ayu/pages/patient/check_symptoms/search_disease.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Search Result";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("images/sub-back.png"), fit: BoxFit.contain),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Center(
                      child: Text(
                        'Suggest Disease by the system:',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(95, 141, 136, 1),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    child: const Center(
                      child: Text(
                        'No Disease Found',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(95, 141, 136, 1),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              buttonInPages('Back To Symptoms', context, SearchDisease(), 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
