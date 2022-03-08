import 'package:ayu/pages/patient/food_recipes/recipe.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class RecipeSelection extends StatefulWidget {
  const RecipeSelection({Key key}) : super(key: key);

  @override
  _RecipeSelectionState createState() => _RecipeSelectionState();
}

class _RecipeSelectionState extends State<RecipeSelection> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Recipe Selection";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final buttonText = "Recipe Name";
    final callFunction = Recipe();
    final topPadding = 0.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Container(
            child: Column(
              children: [
                Text(
                  'You can search recipes related to ayurveda',
                  style: TextStyle(fontSize: 16.00, color: primaryColor),
                ),
                spaceBetweenInputFields,
                inputFields('Search'),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
                spaceBetweenInputFields,
                listView(buttonText, context, callFunction, topPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
