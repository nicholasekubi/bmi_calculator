import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.weight, this.height});

  final int weight;
  final int height;

  String result;
  String BMI;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    CalculatorBrain calculatorBrain =
        CalculatorBrain(height: height, weight: weight);

    BMI = calculatorBrain.calculateBMI();
    result = calculatorBrain.getResult();
    interpretation = calculatorBrain.getInterpretation();

    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$result', style: kResultTextStyle),
                    Text('$BMI', style: kBMITextStyle),
                    Text('$interpretation',
                        textAlign: TextAlign.center, style: kBodyTextStyle),
                  ],
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'RE-CALCULATE'),
          ],
        ),
      ),
    );
  }
}
