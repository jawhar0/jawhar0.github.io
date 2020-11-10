import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/constants.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    return FlatButton(
      onPressed: () {
        _showMyDialog(context);
      },
      child: Container(
        height: height * 0.32,
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: height * 0.32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.3,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Colors.white30,
                              spreadRadius: 3.0,
                              offset: Offset(4, 4),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(4.0),
                                height: height * 0.2,
                                width: height * 0.2,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("maherjaafar.png"),
                                    )),
                              ),
                              Positioned(
                                  right: 5,
                                  child: Image.asset("icons/verified.png")),
                            ],
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Maher Jaafar",
                              style: kTextTitleStyle,
                            ),
                            // TextSpan(
                            //   text: "Jaafar",
                            //   style: kTextTitleStyle.copyWith(
                            //       color: Color(0xFF031F4A)),
                            // ),
                          ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text('About me'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "I'm 22 years old, I'm playing with Flutter and Dart from 2 years.",
                  style: kTextStyle,
                ),
                Text(
                  "I liked Flutter from the first try. I'm creating content on Instagram and Youtube.",
                  style: kTextStyle,
                ),
                Text(
                  "I like to run and explore new places.",
                  style: kTextStyle,
                ),
                Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  child: Image.asset(
                    "animated/tenor.gif",
                    height: 150,
                    width: 150,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
