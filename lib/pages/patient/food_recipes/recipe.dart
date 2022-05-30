import 'dart:convert';

import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../styles/urlForAPI.dart';

class Recipe extends StatefulWidget {
  final int dataFromResponse;
  const Recipe(this.dataFromResponse, {Key key}) : super(key: key);

  @override
  _RecipeState createState() => _RecipeState(dataFromResponse);
}

class _RecipeState extends State<Recipe> {
  final int dataFromResponse;
  _RecipeState(this.dataFromResponse);

  var id;
  var name;
  var category;
  var ingredients;
  var steps;
  var stepsLength;
  var ingredientsLength;

  var responseData;
  var doctorData;
  var ifNoData = "Sorry, there is problem with data";
  var img;

  Future getRecipe(String recipe) async {
    http.Response response;
    var url = Uri.parse(
        baseUrl + "api/FoodRecipes/food-by-id/" + dataFromResponse.toString());

    print(url);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    //print(response.statusCode);

    if (response.body != null) {
      //print(json.decode(response.body));
      var jsonData = json.decode(response.body);
      //print(jsonData[1]['name']);
      responseData = jsonData;

      print(responseData);
      name = responseData['name'];
      category = responseData['category'];
      ingredients = responseData['ingredients'];
      steps = responseData['steps'];
      ingredientsLength = ingredients.split(',').length;
      stepsLength = steps.split(',').length;
      print(ingredients.split(',')[0]);
      print(stepsLength);
      if (category == "Beverages") {
        img = "images/drink.webp";
      } else if (category == "Sweet Beverages") {
        img = "images/drink.webp";
      } else {
        img = "images/food.png";
      }
      return responseData;
    } else {
      return ifNoData;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Recipe";
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = Colors.transparent;

    getRecipe('Belli Juice');
    return Container(
      decoration: BoxDecoration(
        color: secondaryColorThree,
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: NavigationDrawer(),
        appBar: appBarComponent(
            name, appBarBg, textColor, iconColor, bgColor, context),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200.0,
              ),
              FutureBuilder(
                  future: getRecipe(name),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: <Widget>[
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
                                children: <Widget>[
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
                                  for (int i = 0; i < ingredientsLength; i++)
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          responseData['ingredients']
                                              .split(',')[i]
                                              .toString(),
                                          style: TextStyle(
                                            color: primaryColor,
                                          ),
                                        ),
                                        spaceInRecipe,
                                      ],
                                    ),
                                  spaceBetweenInputFields,
                                  for (int i = 0; i < stepsLength; i++)
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                            boxShadow: [
                                              boxShadow,
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Step $i:',
                                                  style: TextStyle(
                                                      color: whiteColor),
                                                ),
                                                spaceInRecipe,
                                                Text(
                                                  responseData['steps']
                                                      .split(',')[i]
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: whiteColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        spaceBetweenInputFields,
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: Text(
                        "Patiently wait until the Names are Loading",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17.0,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
