import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnlineConsultaion extends StatefulWidget {
  const OnlineConsultaion({Key key}) : super(key: key);

  @override
  _OnlineConsultaionState createState() => _OnlineConsultaionState();
}

class _OnlineConsultaionState extends State<OnlineConsultaion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/logo-app.png',
                fit: BoxFit.contain,
                height: 32.0,
                width: 24.0,
              ),
              Image.asset(
                'images/yoga.png',
                fit: BoxFit.contain,
                height: 32.0,
                width: 24.0,
              ),
            ],
          ),
          shadowColor: Colors.transparent,
          backgroundColor: primaryColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/sub.png'), fit: BoxFit.fill),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/menuIcon.png"),
                        fit: BoxFit.contain),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        'Online Consultation',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  decoration: inputFieldDecoration,
                  child: TextField(
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: secondaryColorOne,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
