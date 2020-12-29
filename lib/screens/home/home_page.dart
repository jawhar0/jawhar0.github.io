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
  final _baseUrl = "http://www.maherjaafar.me/assets/assets";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
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
                    title: "Curriculum Vitae",
                  ),
                  FlatButton(
                    onPressed: () {
                      _launchInBrowser(
                          "https://drive.google.com/file/d/1TcJpwJ1xIThZv0a53-zgueWz0TEyZuSX/view?usp=sharing");
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
                            "Open my CV ",
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
                          url: 'https://www.instagram.com/maher.codes',
                          asset: "$_baseUrl/icons/instagram.png",
                          title: "Instagram",
                        ),
                        IconLink(
                          url: 'https://www.linkedin.com/in/engineermaher',
                          asset: "$_baseUrl/icons/linkedin.png",
                          title: "LinkedIn",
                        ),
                        IconLink(
                          url:
                              'https://youtube.com/channel/UCdnbsZZlHKGivUXaVo4EP1Q',
                          asset: "$_baseUrl/icons/youtube.png",
                          title: "Youtube",
                        ),
                        IconLink(
                          url: 'https://twitter.com/MaherJaafar',
                          asset: "$_baseUrl/icons/twitter.webp",
                          title: "Twitter",
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
                          asset: "$_baseUrl/icons/github.png",
                          title: "GitHub",
                        ),
                        IconLink(
                          asset: "$_baseUrl/icons/freelancer-logo.png",
                          url: "https://www.freelancer.com/u/maherjaafar",
                          title: "Freelancer",
                        ),
                        IconLink(
                          asset: "$_baseUrl/icons/stack-overflow.png",
                          url:
                              "https://stackoverflow.com/users/9478226/j-maher",
                          title: "StackOverflow",
                        ),
                      ],
                    ),
                  )
                ],
              ),
              TitleWidget(
                title: "Public github repos",
              ),
              MyGitHubReposWidget(),
            ],
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
