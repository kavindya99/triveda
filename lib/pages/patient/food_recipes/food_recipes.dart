import 'package:ayu/pages/patient/food_recipes/recipe_types.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class FoodRecipes extends StatefulWidget {
  const FoodRecipes({Key key}) : super(key: key);

  @override
  _FoodRecipesState createState() => _FoodRecipesState();
}

class _FoodRecipesState extends State<FoodRecipes> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Food Recipes";
    final appBarBg = 'images/appbar-light.png';
    final textColor = primaryColor;
    final iconColor = primaryColor;
    final bgColor = primaryColor;

    final buttonText1 = 'Food Recipes';
    final callFunction1 = FoodRecipeTypes();
    final topPadding1 = 10.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
      body: SingleChildScrollView(
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
                      "images/food-recipes.gif",
                      height: 229.0,
                      width: 298.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Eat Healthy Food',
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
                      'Always try to eat healthy food to be',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'a healthy person',
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
      ),
    );
  }
}
