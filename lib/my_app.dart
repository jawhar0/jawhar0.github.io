import 'package:flutter/material.dart';
import 'package:jawhar_bouhlel_portfolio/constants.dart';
import 'package:jawhar_bouhlel_portfolio/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jawhar Bouhlel',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: kBAckgroundColor,
      ),
      home: SplashScreen(),
    );
  }
}
