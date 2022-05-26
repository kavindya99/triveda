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

      //id = dataFromResponse;
      print(responseData);
      name = responseData['name'];
      category = responseData['category'];
      ingredients = responseData['ingredients'];
      steps = responseData['steps'];
      stepsLength = ingredients.split(',').length;
      ingredientsLength = steps.split(',').length;
      print(ingredients.split(',')[0]);
      print(stepsLength);
      return responseData;
    } else {
      return ifNoData;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle = "Recipe";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = Colors.transparent;

    getRecipe('Beli Juice');
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
            name, appBarBg, textColor, iconColor, bgColor, context),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 200.0,
                ),
                FutureBuilder(
                    future: getRecipe(name),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (responseData.length != 0) {
                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  color: whiteColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (int i = 0;
                                              i < ingredientsLength;
                                              i++)
                                            Text(
                                              responseData['ingredients'],
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
                                          spaceInRecipe,
                                          Text(
                                            "25 g chopped green chilli",
                                            style: TextStyle(
                                              color: primaryColor,
                                            ),
                                          ),
                                          spaceInRecipe,
                                        ],
                                      ),
                                      spaceBetweenInputFields,
                                      Container(
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
                                            children: [
                                              Text(
                                                'Step 1 :',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                              spaceBetweenInputFields,
                                              Text(
                                                'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      spaceBetweenInputFields,
                                      Container(
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
                                            children: [
                                              Text(
                                                'Step 1 :',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                              spaceBetweenInputFields,
                                              Text(
                                                'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      spaceBetweenInputFields,
                                      Container(
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
                                            children: [
                                              Text(
                                                'Step 1 :',
                                                style: TextStyle(
                                                    color: whiteColor),
                                              ),
                                              spaceBetweenInputFields,
                                              Text(
                                                'biol water and add green jack and salt boil it about 10 minutes and drain water. then heat oil in a  pan and add ginger and garlic',
                                                style: TextStyle(
                                                    color: whiteColor),
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
                          );
                        } else {
                          return Center(
                            child: Text(
                              "Sorry, No items Available for '$dataFromResponse' at this moment",
                              style:
                                  TextStyle(color: errorColor, fontSize: 17.0),
                            ),
                          );
                        }
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
      ),
    );
  }
}
