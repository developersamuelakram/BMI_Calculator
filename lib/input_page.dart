import 'package:bmishit/calculator_brain.dart';
import 'package:bmishit/result_page.dart';
import 'package:bmishit/round_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'first_two_cards.dart';

enum Gender { male, female, notselected }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.notselected;
  int age = 20;
  int weight = 50;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI APP'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: FirstTwoCards(
                  text: 'Male',
                  iconData: Icons.male,
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: FirstTwoCards(
                  text: 'Female',
                  iconData: Icons.female,
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              color: kInactiveCardColour,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            inactiveTrackColor: Color(0xFF8DE98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  color: kInactiveCardColour,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'AGE',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(fontSize: 50.0, color: Colors.white),
                      ),
                      Row(
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  color: kInactiveCardColour,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(fontSize: 50.0, color: Colors.white),
                      ),
                      Row(
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
              onPressed: () {
                CalculatorBrain brain =
                    new CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: brain.calculateBmi(),
                        resultText: brain.getResult(),
                        interpretation: brain.getInterpretation(),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
