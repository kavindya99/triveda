import 'package:ayu/pages/patient/buy_medicine/buy_medicine.dart';
import 'package:ayu/pages/patient/channel_doctor/channel_doctor.dart';
import 'package:ayu/pages/patient/check_symptoms/check_symptoms.dart';
import 'package:ayu/pages/patient/food_recipes/food_recipes.dart';
import 'package:ayu/pages/patient/online_consultation/online_consultation.dart';
import 'package:ayu/pages/patient/yoga/yoga.dart';
import 'package:ayu/styles/navigationDrawer.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
      backgroundColor: Colors.white,
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/appbar-main.png'),
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
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Jhon',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          ),
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
