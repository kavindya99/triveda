import 'package:audioplayers/audioplayers.dart';
import 'package:ayu/pages/sign_in.dart';
import 'package:ayu/styles/variables.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //AudioPlayer player = AudioPlayer();
  AudioCache cache = new AudioCache();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: primaryColor),
        onPressed: () {
          cache.load('images/back.wav');
          cache.play('images/back.wav');
          cache.loop('images/back.wav');
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => SignIn()));
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/aa.png"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/loading-img.png')),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Ayurvedic mobile application for \nonline channeling,\nonline consulting, online ayurvedic shop, \nonline yoga class, food recipes \nand yoga poses.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        shadows: <Shadow>[
                          letterShadow,
                        ],
                      ),
                      textAlign: TextAlign.center,
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
