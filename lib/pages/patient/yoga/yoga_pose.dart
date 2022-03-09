import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class YogaPose extends StatefulWidget {
  const YogaPose({Key key}) : super(key: key);

  @override
  _YogaPoseState createState() => _YogaPoseState();
}

class _YogaPoseState extends State<YogaPose> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Pose 1";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/yoga.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: NavigationDrawer(),
        appBar: appBarComponent(
            pageTitle, appBarBg, textColor, iconColor, bgColor, context),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 300.0,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(20.0),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Steps",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "step one",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "step two",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "step three",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        // spaceBetweenInputFields,
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: primaryColor,
                        //     borderRadius: new BorderRadius.circular(5.0),
                        //     boxShadow: [
                        //       boxShadow,
                        //     ],
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Step 1 :',
                        //           style: TextStyle(color: whiteColor),
                        //         ),
                        //         spaceBetweenInputFields,
                        //         Text(
                        //           'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                        //           style: TextStyle(color: whiteColor),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // spaceBetweenInputFields,
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: primaryColor,
                        //     borderRadius: new BorderRadius.circular(5.0),
                        //     boxShadow: [
                        //       boxShadow,
                        //     ],
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Step 1 :',
                        //           style: TextStyle(color: whiteColor),
                        //         ),
                        //         spaceBetweenInputFields,
                        //         Text(
                        //           'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                        //           style: TextStyle(color: whiteColor),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // spaceBetweenInputFields,
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: primaryColor,
                        //     borderRadius: new BorderRadius.circular(5.0),
                        //     boxShadow: [
                        //       boxShadow,
                        //     ],
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Step 1 :',
                        //           style: TextStyle(color: whiteColor),
                        //         ),
                        //         spaceBetweenInputFields,
                        //         Text(
                        //           'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                        //           style: TextStyle(color: whiteColor),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
