import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChannelingDoctor extends StatefulWidget {
  const ChannelingDoctor({Key key}) : super(key: key);

  @override
  _ChannelingDoctorState createState() => _ChannelingDoctorState();
}

class _ChannelingDoctorState extends State<ChannelingDoctor> {
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2022);
  final lastDate = DateTime(2030);

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Doctor Channeling";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg-forms.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: bgColor,
        drawer: NavigationDrawer(),
        appBar:
            appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
        body: Column(
          children: [
            SizedBox(height: 10),
            Text(
              '$selectedDate'.split(' ')[0],
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: whiteColor),
                onPressed: () => _openDatePicker(context),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Date',
                    style: TextStyle(
                        color: secondaryColorOne,
                        fontSize: 20.0,
                        shadows: [
                          letterShadow,
                        ],
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            inputFields('Date'),
          ],
        ),
      ),
    );
  }

  _openDatePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
