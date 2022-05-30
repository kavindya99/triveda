import 'dart:convert';

import 'package:ayu/pages/patient/food_recipes/recipe.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../styles/urlForAPI.dart';

class RecipeSelection extends StatefulWidget {
  final String dataFromResponse;
  const RecipeSelection(this.dataFromResponse, {Key key}) : super(key: key);

  @override
  _RecipeSelectionState createState() =>
      _RecipeSelectionState(dataFromResponse);
}

class _RecipeSelectionState extends State<RecipeSelection> {
  final String dataFromResponse;
  _RecipeSelectionState(this.dataFromResponse);

  var id;
  var name;
  var category;

  var responseData;
  var doctorData;
  var ifNoData = "Sorry, there is problem with data";

  Future getRecipes(String category) async {
    http.Response response;
    var url = Uri.parse(baseUrl + "api/FoodRecipes/" + dataFromResponse);

    //print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    print(response.statusCode);

    if (response.body != null) {
      //print(json.decode(response.body));
      var jsonData = json.decode(response.body);
      //print(jsonData[1]['name']);
      responseData = jsonData;

      //id = dataFromResponse;
      print(responseData);
      name = responseData['name'];
      category = responseData['category'];
      return responseData;
    } else {
      return ifNoData;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBarBg = 'images/appbar-dark.webp';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    final topPadding = 0.0;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          dataFromResponse, appBarBg, textColor, iconColor, bgColor, context),
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
                FutureBuilder(
                    future: getRecipes(category),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (responseData.length != 0) {
                          return Column(
                            children: [
                              //for(var u in userData)
                              for (int i = 0; i < responseData.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: listView(
                                      responseData[i]['name'],
                                      context,
                                      Recipe(responseData[i]['id']),
                                      topPadding),
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
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('images/waiting.webp'),
                            ),
                            Text(
                              "Patiently wait until the Names are Loading",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 17.0,
                              ),
                            ),
                          ],
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
