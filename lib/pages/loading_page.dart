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
  AudioCache cache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: primaryColor),
        onPressed: () {
          cache.load('back.mp3');
          cache.play('back.mp3');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/aa.webp"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/loading-img.webp')),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Ayurvedic mobile application for \nonline channeling,\n consulting, ayurvedic shop, \nyoga class, food recipes \nand yoga poses.',
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
