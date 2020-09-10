import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color color;

  ReusableCard({@required this.color, this.onTap, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child,
            ],
          ),
          height: 200.0,
          width: 170.0,
        ),
      ),
    );
  }
}
//Color(0xff111428)

/*Text(
                'M',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
 */
