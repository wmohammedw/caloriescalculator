import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caloriescalculator/Component/ReusebleCard.dart';
import 'package:caloriescalculator/constantes.dart';
import 'package:caloriescalculator/Tools/ButtonCalc.dart';
import 'package:caloriescalculator/data.dart';

class ResultPage extends StatefulWidget {
  final Data newPerson;
  ResultPage({this.newPerson});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double cal, lcal, BMR;
  String bodyType;

  @override
  void initState() {
    super.initState();

    switch (widget.newPerson.gender) {
      case 0:
        BMR = 88.362 +
            (13.397 * widget.newPerson.weight) +
            (4.799 * widget.newPerson.height) -
            (5.677 * widget.newPerson.age);
        calories(BMR);
        break;
      case 1:
        BMR = 447.593 +
            (9.247 * widget.newPerson.weight) +
            (3.098 * widget.newPerson.height) -
            (4.330 * widget.newPerson.age);
        calories(BMR);
        break;
    }
  }

  void calories(double BMR) {
    switch (widget.newPerson.avtivitylevel) {
      case 0:
        cal = BMR * 1.2;
        lcal = cal - 500;
        break;
      case 1:
        cal = BMR * 1.375;
        lcal = cal - 500;
        break;
      case 2:
        cal = BMR * 1.55;
        lcal = cal - 500;
        break;
      case 3:
        cal = BMR * 1.725;
        lcal = cal - 500;
        break;
      case 4:
        cal = BMR * 1.9;
        lcal = cal - 500;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Calories Calculator'),
        ),
        backgroundColor: Color(0xff0A0D22),
      ),
      backgroundColor: Color(0xff090C21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              'Your Result',
              style: klabels,
            ),
          ),
          ReusableCard(
            color: kCardColor,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'to maintain: ' + cal.toStringAsFixed(2) + ' Cal',
                    style: klabels,
                  ),
                  Text(
                    'to lose weight: ' + lcal.toStringAsFixed(2) + ' Cal',
                    style: klabels,
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          ButtonCalc(
            text: 'ReCalculate',
            onTap: () {
              print(widget.newPerson.avtivitylevel);
              print(widget.newPerson.age);
              print(widget.newPerson.weight);
              print(widget.newPerson.height);
              print(widget.newPerson.gender);
            },
          ),
        ],
      ),
    );
  }
}

/*Text(
'overweight',
style: TextStyle(
fontSize: 50.0,
fontWeight: FontWeight.bold,
color: Colors.green,
),
),*/
