import 'package:flutter/material.dart';
import 'package:caloriescalculator/constantes.dart';

class activityLevels extends StatelessWidget {
  final text;
  final icon;

  activityLevels({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(text, style: klabels),
        SizedBox(
          height: 10.0,
        ),
        Icon(
          icon,
          size: 50.0,
          color: Colors.white,
        ),
      ],
    );
  }
}
