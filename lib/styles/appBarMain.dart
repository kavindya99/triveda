import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSize appBarMain(textTitleMain, textTitleSub) => PreferredSize(
      preferredSize: Size.fromHeight(240),
      child: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/appbar-main.png'), fit: BoxFit.fill),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          textTitleMain,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          textTitleSub,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
