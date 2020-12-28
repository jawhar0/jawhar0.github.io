import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/constants.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/icon_link.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/my_appbar.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/my_github_repos_widget.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/title_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final _baseUrl = "http://www.maherjaafar.me/assets/assets";
  //var _current = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCustomAppBar(),
              Container(
                  margin: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  )),
              Column(
                children: [
                  TitleWidget(
                    title: "About me",
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(kDefaultPadding),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2),
                          alignment: Alignment.centerLeft,
                          height:
                              width > height ? height * 0.18 : height * 0.25,
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
                          child: Text(
                            "I'm 22 years old, I'm playing with Flutter and Dart from 2 years. I liked Flutter from the first try. I'm creating content on Instagram and Youtube. I like to run and explore new places.",
                            style: width > height
                                ? kTextStyle.copyWith(
                                    color: Colors.white, fontSize: 25)
                                : kTextStyle.copyWith(color: Colors.white),
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
              //TODO: include instagram API and implement Carousel
              // Column(
              //   children: [
              //     CarouselSlider(
              //       items: imageSliders,
              //       options: CarouselOptions(
              //           height: height * 0.93,
              //           autoPlay: true,
              //           enlargeCenterPage: true,
              //           aspectRatio: 2.0,
              //           onPageChanged: (index, reason) {
              //             setState(() {
              //               _current = index;
              //             });
              //           }),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: imgList.map((url) {
              //         int index = imgList.indexOf(url);
              //         return Container(
              //           width: 8.0,
              //           height: 8.0,
              //           margin:
              //               EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: _current == index
              //                 ? Color.fromRGBO(255, 255, 255, 0.9)
              //                 : Color.fromRGBO(255, 255, 255, 0.4),
              //           ),
              //         );
              //       }).toList(),
              //     ),
              //   ],
              // ),
              TitleWidget(
                title: "Public github repos",
              ),
              MyGitHubReposWidget(),
              // TitleWidget(
              //   title: "Youtube videos",
              // ),
              // YoutubeVideosWidget(),
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
