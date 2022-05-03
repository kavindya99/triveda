import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;

  const CustomDialog({Key key, this.title, this.description, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: whiteColor,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 50,
            backgroundImage: AssetImage('images/food-recipe-types-2.gif'),
          ),
        ),
      ],
    );
  }
}
