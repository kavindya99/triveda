import 'package:ayu/pages/patient/yoga/types/sun_salutation.dart';
import 'package:ayu/pages/patient/yoga/yoga_list.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class YogaPoses extends StatefulWidget {
  const YogaPoses({Key key}) : super(key: key);

  @override
  _YogaPosesState createState() => _YogaPosesState();
}

class _YogaPosesState extends State<YogaPoses> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Recipe Categories";
    final appBarBg = 'images/appbar-dark.png';
    final textColor = whiteColor;
    final iconColor = whiteColor;
    final bgColor = whiteColor;

    return Scaffold(
      backgroundColor: bgColor,
      drawer: NavigationDrawer(),
      appBar: appBarComponent(
          pageTitle, appBarBg, textColor, iconColor, bgColor, context),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorTwo),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YogaList()));
                  },
                  child: Center(
                    child: Text(
                      'Sun \nSalutation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Image.asset('images/yoga-pose-types.gif'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YogaList()));
                  },
                  child: Center(
                    child: Text(
                      'Kundalanee \nYoga',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => YogaList()));
                  },
                  child: Center(
                    child: Text(
                      'Chandra \nNamaskaraya',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
/*                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SweetItems()));
                  },
                  child: Center(
                    child: Text(
                      'Non \nVegetarian',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SweetItems()));
                  },
                  child: Center(
                    child: Text(
                      'Cooking \nRecipes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorTwo),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SweetItems()));
                  },
                  child: Center(
                    child: Text(
                      'Pre-cooking Food \nRecipes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          shadows: [
                            letterShadow,
                          ],
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
