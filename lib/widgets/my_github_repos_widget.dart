import 'dart:html';

import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/constants.dart';
import 'package:maher_jaafar_portfolio/repositories/github_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class MyGitHubReposWidget extends StatelessWidget {
  const MyGitHubReposWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    final githubRepo = GithubDataRepository();

    final _baseUrl = "http://maherjaafar.me/assets/assets";

    return FutureBuilder(
      future: githubRepo.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: data.map<Widget>((e) {
              return Container(
                height: height * 0.1,
                width: width > height ? width * 0.4 : double.infinity,
                margin: EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2.0, 2.0),
                      color: Colors.white,
                    ),
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {
                    _launchInBrowser(e['html_url']);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        "$_baseUrl/icons/github.png",
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${e['name']}",
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              if (e['description'] != null)
                                Text(
                                  "${e['description']}",
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                      color: Colors.black),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
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
