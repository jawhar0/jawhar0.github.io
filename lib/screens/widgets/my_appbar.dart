import 'package:flutter/material.dart';
import 'package:jawhar_bouhlel_portfolio/constants.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key key,
  }) : super(key: key);

  final _baseUrl = "https://jawhar0.github.io/assets/assets";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    return FlatButton(
      onPressed: () {},
      child: Container(
        height: height * 0.35,
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: height * 0.35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.33,
                      width: width * 0.8,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0), boxShadow: [
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
                                      fit: BoxFit.cover,
                                      image: NetworkImage("$_baseUrl/jawharprofilepic.jpg"),
                                    )),
                              ),
                              Positioned(right: 5, child: Image.network("$_baseUrl/icons/verified.png")),
                            ],
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Jawhar Bouhlel",
                              style: kTextTitleStyle,
                            ),
                          ),
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
}
