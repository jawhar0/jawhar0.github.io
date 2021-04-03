import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jawhar_bouhlel_portfolio/animated_background/fancy_background.dart';
import 'package:jawhar_bouhlel_portfolio/screens/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2, milliseconds: 500),
        () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MyHomePage(title: 'Jawhar Bouhlel'))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: AnimatedBackground()),
          onBottom(AnimatedWave(
            height: 180,
            speed: 1.0,
          )),
          onBottom(AnimatedWave(
            height: 120,
            speed: 0.9,
            offset: pi,
          )),
          onBottom(AnimatedWave(
            height: 220,
            speed: 1.2,
            offset: pi / 2,
          )),
          Positioned.fill(child: CenteredText()),
        ],
      ),
    );
  }

  Widget onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
