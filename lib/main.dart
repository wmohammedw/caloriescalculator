import 'package:flutter/material.dart';
import 'package:caloriescalculator/Component/ReusebleCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constantes.dart';
import 'package:caloriescalculator/Component/resultPage.dart';
import 'Tools/activityLevels.dart';
import 'Tools/ButtonButton.dart';
import 'Tools/ButtonCalc.dart';
import 'data.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  final Data newPerson = Data();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              newPerson: newPerson,
            ),
        '/result': (context) => ResultPage(
              newPerson: newPerson,
            ),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );
  final Data newPerson;
  HomePage({this.newPerson});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090C21),
      appBar: AppBar(
        title: Center(
          child: Text('Calories Calculator'),
        ),
        backgroundColor: Color(0xff0A0D22),
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          InfoPageOne(
            newPerson: newPerson,
          ),
          InfoPageTwo(
            newPerson: newPerson,
          ),
        ],
      ),
    );
  }
}

enum Gender {
  male,
  female,
}

class InfoPageOne extends StatefulWidget {
  final Data newPerson;
  InfoPageOne({this.newPerson});
  @override
  _InfoPageOneState createState() => _InfoPageOneState();
}

class _InfoPageOneState extends State<InfoPageOne> {
  Gender selectedGender;

  int height = 150, weight = 50, age = 15;

  double sliderValue = 150;

  @override
  void initState() {
    super.initState();
    widget.newPerson.height = height;
    widget.newPerson.weight = weight;
    widget.newPerson.age = age;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color:
                    (selectedGender == Gender.male) ? kactaveColor : kCardColor,
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                    widget.newPerson.gender = selectedGender.index;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.mars,
                      size: 80.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Male', style: klabels),
                  ],
                ),
              ),
              ReusableCard(
                color: (selectedGender == Gender.female)
                    ? kactaveColor
                    : kCardColor,
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                    widget.newPerson.gender = selectedGender.index;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.venus,
                      size: 80.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Female', style: klabels),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color: kCardColor,
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Text(
                      'Height',
                      style: klabels,
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$height',
                          style: klabels,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('cm', style: klabels),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Slider(
                      onChanged: (newValue) {
                        setState(() {
                          sliderValue = newValue;
                          height = sliderValue.toInt();
                          widget.newPerson.height = height;
                        });
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      min: 130.0,
                      max: 250.0,
                      value: sliderValue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color: kCardColor,
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Text('$weight Kg', style: klabels),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonButton(
                          icon: Icon(
                            Icons.add,
                            color: kButton,
                          ),
                          onPressed: () {
                            setState(() {
                              (weight > 250) ? weight = 250 : weight++;
                              widget.newPerson.weight = weight;
                            });
                          },
                        ),
                        ButtonButton(
                          icon: Icon(
                            Icons.remove,
                            color: kButton,
                          ),
                          onPressed: () {
                            setState(() {
                              (weight < 0) ? weight = 0 : weight--;
                              widget.newPerson.weight = weight;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ReusableCard(
                color: kCardColor,
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Text('$age age', style: klabels),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonButton(
                          icon: Icon(
                            Icons.add,
                            color: kButton,
                          ),
                          onPressed: () {
                            setState(() {
                              (age > 100) ? age = 90 : age++;
                              widget.newPerson.age = age;
                            });
                          },
                        ),
                        ButtonButton(
                          icon: Icon(
                            Icons.remove,
                            color: kButton,
                          ),
                          onPressed: () {
                            setState(() {
                              (age < 0) ? age = 0 : age--;
                              widget.newPerson.age = age;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum Activity { inactive, OnetoThree, ThreetoFive, Fivetoseven, HighActivity }

class InfoPageTwo extends StatefulWidget {
  final Data newPerson;
  InfoPageTwo({this.newPerson});

  @override
  _InfoPageTwoState createState() => _InfoPageTwoState();
}

class _InfoPageTwoState extends State<InfoPageTwo> {
  Activity selectedActivity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'chose your activity level',
          style: klabels,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color: (selectedActivity == Activity.inactive)
                    ? kactaveColor
                    : kCardColor,
                onTap: () {
                  setState(() {
                    selectedActivity = Activity.inactive;
                    widget.newPerson.avtivitylevel = selectedActivity.index;
                  });
                },
                child: activityLevels(
                  icon: Icons.airline_seat_individual_suite,
                  text: 'inactive',
                ),
              ),
              ReusableCard(
                color: (selectedActivity == Activity.OnetoThree)
                    ? kactaveColor
                    : kCardColor,
                onTap: () {
                  setState(() {
                    selectedActivity = Activity.OnetoThree;
                    widget.newPerson.avtivitylevel = selectedActivity.index;
                  });
                },
                child: activityLevels(
                  icon: FontAwesomeIcons.walking,
                  text: '1 - 3 days',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color: (selectedActivity == Activity.ThreetoFive)
                    ? kactaveColor
                    : kCardColor,
                onTap: () {
                  setState(() {
                    selectedActivity = Activity.ThreetoFive;
                    widget.newPerson.avtivitylevel = selectedActivity.index;
                  });
                },
                child: activityLevels(
                  icon: FontAwesomeIcons.running,
                  text: '3 - 5 days',
                ),
              ),
              ReusableCard(
                color: (selectedActivity == Activity.Fivetoseven)
                    ? kactaveColor
                    : kCardColor,
                onTap: () {
                  setState(() {
                    selectedActivity = Activity.Fivetoseven;
                    widget.newPerson.avtivitylevel = selectedActivity.index;
                  });
                },
                child: activityLevels(
                  icon: Icons.directions_bike,
                  text: '5 - 7 days',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              ReusableCard(
                color: (selectedActivity == Activity.HighActivity)
                    ? kactaveColor
                    : kCardColor,
                onTap: () {
                  setState(() {
                    selectedActivity = Activity.HighActivity;
                    widget.newPerson.avtivitylevel = selectedActivity.index;
                  });
                },
                child: activityLevels(
                  text: 'high activity',
                  icon: Icons.fitness_center,
                ),
              ),
            ],
          ),
        ),
        ButtonCalc(
          text: 'Calculate',
          onTap: () {
            if (widget.newPerson.gender == null &&
                widget.newPerson.avtivitylevel == null)
              return;
            else
              Navigator.pushNamed(context, '/result');
          },
        ),
      ],
    );
  }
}
