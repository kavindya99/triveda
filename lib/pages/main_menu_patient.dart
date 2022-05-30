import 'dart:convert';

import 'package:ayu/pages/patient/buy_medicine/buy_medicine.dart';
import 'package:ayu/pages/patient/channel_doctor/channel_doctor.dart';
import 'package:ayu/pages/patient/check_symptoms/check_symptoms.dart';
import 'package:ayu/pages/patient/food_recipes/food_recipes.dart';
import 'package:ayu/pages/patient/online_consultation/online_consultation.dart';
import 'package:ayu/pages/patient/yoga/yoga.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/customDialogBox.dart';
import '../styles/urlForAPI.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Map userData;

  var name;

  Future getDataFromApi() async {
    http.Response response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI1ZWI5N2ZjNy1jODRkLTQ5MjMtODVkMC1lMWJmNTgyZTcwY2YiLCJ1bmlxdWVfbmFtZSI6ImthdmluZHlhc2FuZGVlcGFuaTE5OTlAZ21haWwuY29tIiwiZW1haWwiOiJrYXZpbmR5YXNhbmRlZXBhbmkxOTk5QGdtYWlsLmNvbSIsImp0aSI6Ijc1MTc2ZTdhLWQ5MDUtNDRhMy1hMDIyLTJkNTg2YWZiMTUyNiIsImV4cCI6MTY1MjM5Mjg4NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo0NDM0NCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMC8ifQ.tQ2Lp7lU8V4ZzgFV7wdzoT_N6j8jbYtywDmiLPmTAv4";
    var url = Uri.parse(baseUrl + 'user/profile-patient');

    print(token);
    response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 405) {
      showDialog(
          context: this.context,
          builder: (context) => CustomDialog(
                title: "Error",
                description: "405",
              ));
    }

    print(response.statusCode);
    if (response.statusCode == 200) {
      userData = json.decode(response.body);
      //print("response body :" + json.decode(response.body));
      //print("hi");
      print(userData);
      if (userData['name'].split(' ').length > 1) {
        name = userData['name'].split(' ')[0];
      } else {
        name = userData['name'];
      }

      return userData;
    } else {
      return "true";
    }
  }

  @override
  Widget build(BuildContext context) {
    final tileLink1 = OnlineConsultaion();
    final tileText1 = 'Online \nConsultation';
    final tileLink2 = BuyMedicine();
    final tileText2 = 'Buy \nMedicine';
    final tileLink3 = CheckSymptoms();
    final tileText3 = 'Check \nSymptoms';
    final tileLink4 = ChannelDoctor();
    final tileText4 = 'Channel a \nDoctor';
    final tileLink5 = FoodRecipes();
    final tileText5 = 'Food \nRecipes';
    final tileLink6 = Yoga();
    final tileText6 = 'Yoga';

    return Scaffold(
      backgroundColor: whiteColor,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: whiteColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/appbar-main.webp'),
                  fit: BoxFit.fill),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(250),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                          FutureBuilder(
                              future: getDataFromApi(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Text(
                                    name,
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700),
                                  );
                                } else {
                                  return Text(
                                    'User',
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(30),
            sliver: SliverGrid.count(
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: <Widget>[
                mainMenuTile(context, tileLink1, tileText1),
                mainMenuTile(context, tileLink2, tileText2),
                mainMenuTile(context, tileLink3, tileText3),
                mainMenuTile(context, tileLink4, tileText4),
                mainMenuTile(context, tileLink5, tileText5),
                mainMenuTile(context, tileLink6, tileText6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
