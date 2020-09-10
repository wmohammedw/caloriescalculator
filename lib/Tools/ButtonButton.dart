import 'package:flutter/material.dart';

class ButtonButton extends StatelessWidget {
  final icon;
  final Function onPressed;
  ButtonButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      elevation: 5.0,
      fillColor: Color(0xff1C1F32),
      child: icon,
      constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
    );
  }
}
