import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  const Recipe({Key key}) : super(key: key);

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Recipe";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/food.png"),
          fit: BoxFit.fitHeight,
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
                  height: 200.0,
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
                          "Ingredients",
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
                          "1/2 Kg of green jack cut into 1/2 cm peaces",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "50 g carrot (cut into small peaces)",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "50 g carrot (cut into small peaces)",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "50 g chopped red onion",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "25 g chopped green chilli",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "25 g chopped green chilli",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        Text(
                          "25 g chopped green chilli",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          "25 g chopped green chilli",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                        spaceInRecipe,
                        spaceBetweenInputFields,
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: new BorderRadius.circular(5.0),
                            boxShadow: [
                              boxShadow,
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Step 1 :',
                                  style: TextStyle(color: whiteColor),
                                ),
                                spaceBetweenInputFields,
                                Text(
                                  'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                                  style: TextStyle(color: whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        spaceBetweenInputFields,
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: new BorderRadius.circular(5.0),
                            boxShadow: [
                              boxShadow,
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Step 1 :',
                                  style: TextStyle(color: whiteColor),
                                ),
                                spaceBetweenInputFields,
                                Text(
                                  'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                                  style: TextStyle(color: whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        spaceBetweenInputFields,
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: new BorderRadius.circular(5.0),
                            boxShadow: [
                              boxShadow,
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Step 1 :',
                                  style: TextStyle(color: whiteColor),
                                ),
                                spaceBetweenInputFields,
                                Text(
                                  'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                                  style: TextStyle(color: whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
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
