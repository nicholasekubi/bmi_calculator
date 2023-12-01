import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

enum Gender { male, female }

Gender selectedGender;
double currentSliderValue = 110;
int weight = 50;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    int sliderValue = currentSliderValue.round();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressFunction: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.mars,
                      textData: 'MALE',
                    ),
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressFunction: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: CardContent(
                      cardIcon: FontAwesomeIcons.venus,
                      textData: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  )),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Center(
                          child: Text(
                            '$sliderValue',
                            style: kNumberTextStyle,
                          ),
                        ),
                        Center(
                          child: Text('cm', style: kLabelTextStyle),
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0, elevation: 10),
                      overlayColor: Color(0x1FEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF888996),
                      thumbColor: Color(0xFFEA1556),
                      trackHeight: 27,
                    ),
                    child: Slider(
                      value: currentSliderValue,
                      max: 200,
                      min: 10,
                      divisions: 190,
                      onChanged: (double newSliderValue) {
                        setState(() {
                          currentSliderValue = newSliderValue;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTapped: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              onLongTapped: () {
                                setState(() {
                                  weight -= 10;
                                });
                              },
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTapped: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onLongTapped: () {
                                setState(() {
                                  weight += 10;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTapped: () {
                                setState(() {
                                  age--;
                                });
                              },
                              onLongTapped: () {
                                setState(() {
                                  age -= 10;
                                });
                              },
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTapped: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onLongTapped: () {
                                setState(() {
                                  age += 10;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            weight: weight,
                            height: currentSliderValue.toInt(),
                          )));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
