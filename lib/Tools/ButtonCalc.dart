import 'package:flutter/material.dart';
import 'package:caloriescalculator/constantes.dart';

class ButtonCalc extends StatelessWidget {
  final text;
  final Function onTap;
  ButtonCalc({this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xffEB1555),
        child: Center(
          child: Text(
            text,
            style: klabels,
          ),
        ),
        width: double.infinity,
        height: 70.0,
      ),
    );
  }
}
