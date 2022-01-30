import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawer.dart';
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
    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar:
          appBarComponent(pageTitle, appBarBg, textColor, iconColor, bgColor),
    );
  }
}
