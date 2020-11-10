import 'package:flutter/material.dart';

import 'package:maher_jaafar_portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class IconLink extends StatelessWidget {
  const IconLink({Key key, this.url, this.asset, this.title}) : super(key: key);

  final String url;
  final String asset;
  final String title;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    return Expanded(
        child: FlatButton(
      onPressed: () {
        _launchInBrowser(url);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              child: Image.asset(
                asset,
                width: width * 0.2,
                height: height * 0.1,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: kDefaultPadding / 2),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    ));
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
