import 'package:api_project/homepage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //navigate();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/rating.png',fit: BoxFit.fill,)),
                Text('Direct WhatsApp', style: TextStyle(color: Colors.white, fontSize: 35),)
              ],
            ),
          ),
        ),
        duration: 2500,
        splashTransition: SplashTransition.sizeTransition,
        splashIconSize: double.infinity,
        nextScreen: MyHomePage());
  }
}