import 'package:ayu/pages/patient/buy_medicine/medicine_selection.dart';
import 'package:ayu/styles/appBar.dart';
import 'package:ayu/styles/navigationDrawerPatient.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class MedicineTypes extends StatefulWidget {
  const MedicineTypes({Key key}) : super(key: key);

  @override
  _MedicineTypesState createState() => _MedicineTypesState();
}

class _MedicineTypesState extends State<MedicineTypes> {
  @override
  Widget build(BuildContext context) {
    final pageTitle = "Medicine Categories";
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
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: <Widget>[
                Image.asset('images/food-recipe-types-2.gif'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Arishta',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Kalka',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Thaila',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Kwaatha',
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
                Image.asset('images/food-recipe-types-1.gif'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Aasawa',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Pani',
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
                Image.asset('images/food-recipe-types-1.gif'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColorOne),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Kasaaya',
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
                  style: ElevatedButton.styleFrom(primary: secondaryColorThree),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Paantha',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Choorna',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Beauty',
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
                  style: ElevatedButton.styleFrom(primary: secondaryColorThree),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineSelection()));
                  },
                  child: Center(
                    child: Text(
                      'Guli',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
