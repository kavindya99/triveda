import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';

final buttonText1 = '';
final callFunction1 = '';
final topPadding1 = 0.0;
final buttonText2 = '';
final callFunction2 = '';
final topPadding2 = 0.0;
final context = 'context';

SingleChildScrollView bodyDarkTwoButtons(imageFilePath, mainText, subText) =>
    SingleChildScrollView(
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
                    imageFilePath,
                    height: 229.0,
                    width: 298.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mainText,
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
                    subText,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: buttonInPages(
                        buttonText2, context, callFunction2, topPadding2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

SingleChildScrollView bodyDarkOneButton(imageFilePath, mainText, subText) =>
    SingleChildScrollView(
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
                    imageFilePath,
                    height: 229.0,
                    width: 298.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mainText,
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
                    subText,
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
    );
