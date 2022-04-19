import 'package:bmi_calc/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusabble_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calc/components/round_button.dart';
import 'package:bmi_calc/components/bottom_button.dart';
import 'package:bmi_calc/calculate_brain.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  /// задаем рост
  int _height = 180;

  /// задаем вес
  int _weight = 60;

  /// задаем возраст
  int _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kColorContainerApp
                        : kInactiveColorCard,
                    cardWidget: IconCard(
                      icon: FontAwesomeIcons.mars,
                      textCard: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardWidget: IconCard(
                      icon: FontAwesomeIcons.venus,
                      textCard: "FEMALE",
                    ),
                    colour: selectedGender == Gender.female
                        ? kColorContainerApp
                        : kInactiveColorCard,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kStyleText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("$_height", style: kStyleSliderText),
                      Text(
                        "cm",
                        style: kStyleText,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 35),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 120.0,
                      max: 240.0,
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kColorContainerApp,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kStyleText),
                        Text(_weight.toString(), style: kStyleSliderText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onClick: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onClick: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kColorContainerApp,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kStyleText),
                        Text(_age.toString(), style: kStyleSliderText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onClick: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onClick: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kColorContainerApp,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(title: "CALCULATE", onTap: () {
            CalculateBrain calc = CalculateBrain(height: _height, weight: _weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(bmi: calc.calculateBmi(), resultBMI: calc.resultBMI(), infoBMI: calc.infoBMI())),);
          },),
        ],
      ),
    );
  }
}



