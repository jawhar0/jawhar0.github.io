import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/constants.dart';
import 'package:maher_jaafar_portfolio/screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maher Jaafar',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: kBAckgroundColor,
      ),
      home: SplashScreen(),
    );
  }
}
