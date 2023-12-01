import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.icon, @required this.onTapped, this.onLongTapped});

  final IconData icon;
  final Function onTapped;
  final Function onLongTapped;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTapped,
      onLongPress: onLongTapped,
      child: FaIcon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
