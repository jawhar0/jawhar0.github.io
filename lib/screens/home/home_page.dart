import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/constants.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/icon_link.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/my_appbar.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/github_repos_widget.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/title_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _baseUrl = "https://jawhar0.github.io/assets/assets";

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Scrollbar(
          isAlwaysShown: true,
          thickness: 8.0,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                MyCustomAppBar(),
                Column(
                  children: [
                    TitleWidget(
                      title: "About me",
                    ),
                    Container(
                      margin: EdgeInsets.all(kDefaultPadding),
                      padding: EdgeInsets.symmetric(
                          vertical: kDefaultPadding,
                          horizontal: kDefaultPadding / 2),
                      alignment: Alignment.centerLeft,
                      // height: width > height ? height * 0.18 : height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff3499FF),
                          Color(0xff3A3985),
                          Color(0xff3A3985)
                        ], stops: [
                          0,
                          0.5,
                          0.9
                        ]),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2.0, 2.0),
                            color: Colors.white,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              kDescription,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    TitleWidget(
                      title: "My portfolio",
                    ),
                    FlatButton(
                      onPressed: () {
                        _launchInBrowser(
                            "https://drive.google.com/drive/folders/1-8ol1BM4w9laI-SOHDbwfjeIIIHM80Jj");
                      },
                      child: Container(
                        margin: const EdgeInsets.all(kDefaultPadding),
                        height: height * 0.1,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Open my portflio ",
                              style: kTextStyle,
                            ),
                            Icon(Icons.open_in_browser)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                            url: 'https://www.instagram.com/jawhar_bouhlel/',
                            asset: "$_baseUrl/icons/instagram.png",
                            title: "Instagram",
                          ),
                          IconLink(
                            url: 'https://www.linkedin.com/in/jawhar-bouhlel/',
                            asset: "$_baseUrl/icons/linkedin.png",
                            title: "LinkedIn",
                          ),
                          IconLink(
                            url: 'https://twitter.com/jawhar_bouhlel',
                            asset: "$_baseUrl/icons/twitter.webp",
                            title: "Twitter",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
