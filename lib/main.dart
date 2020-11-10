import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/widgets/title_widget.dart';

import 'package:maher_jaafar_portfolio/constants.dart';
import 'package:maher_jaafar_portfolio/widgets/icon_link.dart';
import 'package:maher_jaafar_portfolio/widgets/my_appbar.dart';

void main() {
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
      ),
      home: MyHomePage(title: 'Maher Jaafar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyCustomAppBar(),
            Column(
              children: [
                TitleWidget(
                  title: "My content",
                ),
                Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      IconLink(
                        url: 'https://www.instagram.com/maher.codes',
                        asset: "icons/instagram.png",
                        title: "Instagram",
                      ),
                      IconLink(
                        url: 'https://www.youtube.com/maherjaafar',
                        asset: "icons/youtube.png",
                        title: "Youtube",
                      ),
                      IconLink(
                        url: 'https://www.linkedin.com/engineermaher',
                        asset: "icons/linkedin.png",
                        title: "LinkedIn",
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                TitleWidget(
                  title: "Professional",
                ),
                Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      IconLink(
                        url: 'https://www.github.com/maherjaafar',
                        asset: "icons/github.png",
                        title: "GitHub",
                      ),
                      IconLink(
                        asset: "icons/freelancer-logo.png",
                        url: "https://www.freelancer.com/u/maherjaafar",
                        title: "Freelancer",
                      ),
                      IconLink(
                        asset: "icons/stack-overflow.png",
                        url: "https://stackoverflow.com/users/9478226/j-maher",
                        title: "StackOverflow",
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
