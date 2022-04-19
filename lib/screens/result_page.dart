import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/components/reusabble_card.dart';
import 'package:bmi_calc/components/bottom_button.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi, required this.resultBMI,required this.infoBMI});
  final String bmi;
  final String resultBMI;
  final String infoBMI;



  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kStyleResulText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kColorContainerApp,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultBMI,
                    style: kStyleStatusBMI,
                  ),
                  Text(
                    bmi,
                    style: kStyleBMIText,
                  ),
                  Text(
                    infoBMI,
                    style: kStyleDescriptionText,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
              onPress: () {},
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: "RE-CALCULATE"),
        ],
      ),
    );
  }
}

