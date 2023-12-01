import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class CardContent extends StatelessWidget {
  CardContent({this.cardIcon, this.textData});

  final IconData cardIcon;
  final String textData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textData,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
