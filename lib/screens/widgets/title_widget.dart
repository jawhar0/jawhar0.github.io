import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/constants.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Positioned(
            left: 5.0,
            bottom: 1.0,
            child: Container(
              color: Colors.white70,
              height: 2.0,
              width: width * 0.8,
            ),
          ),
          Text(
            title,
            maxLines: 1,
            softWrap: false,
            style: kTextTitleStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
