import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSize appBarComponent(
        pageTitle, appBarBg, textColor, iconColor, backgroundColor) =>
    PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'images/profile-image.png',
              fit: BoxFit.contain,
              height: 40.0,
              width: 40.0,
            ),
          ],
        ),
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(appBarBg), fit: BoxFit.fill),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      pageTitle,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
