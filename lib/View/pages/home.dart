import 'package:bmi_calculator/View/pages/result.dart';
import 'package:bmi_calculator/Widget/widgets.dart';
import 'package:bmi_calculator/constant/constants.dart';
import 'package:bmi_calculator/model/bmi_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 160;
  int _weight = 60;
  int _age = 18;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: GenderCard(
                          color: selectedGender == Gender.male
                              ? selectedColor
                              : unselectedColor,
                          context: context,
                          icon: Icons.male,
                          text: 'MALE',
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          })),
                  Expanded(
                      child: GenderCard(
                          color: selectedGender == Gender.female
                              ? selectedColor
                              : unselectedColor,
                          context: context,
                          icon: Icons.female,
                          text: 'FEMALE',
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          })),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      'Height',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _height.toString().substring(0, 3),
                          style: textStyle,
                        ),
                        Text(
                          'cm',
                          style: boldText,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: selectedColor,
                      value: _height,
                      min: 120,
                      max: 200,
                      divisions: 80,
                      onChanged: (double value) {
                        setState(() {
                          _height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableWidget(
                        titleText: 'Weight',
                        valueText: _weight.toString(),
                        plusTap: () {
                          _weight++;
                          setState(() {});
                        },
                        minusTap: () {
                          _weight--;
                          setState(() {});
                        }),
                  ),
                  Expanded(
                    child: ReusableWidget(
                        titleText: 'Age',
                        valueText: _age.toString(),
                        plusTap: () {
                          setState(() {
                            _age++;
                          });
                        },
                        minusTap: () {
                          setState(() {
                            _age--;
                          });
                        }),
                  )
                ],
              ),
            ),
            CustomButton(
                onTap: () async {
                  bmiModel bmi =
                      bmiModel(height: _height.toInt(), weight: _weight);
                  var status = await Navigator.push(context,
                      MaterialPageRoute(builder: (_) {
                    return ResultPage(
                        message: bmi.getMessage(),
                        bmiReult: bmi.getBmiResult(),
                        bodyCondition: bmi.getBodyCondition());
                  }));

                  if (status != null && status == 'back') {
                    setState(() {
                      _height = 160;
                      _weight = 60;
                      _age = 18;
                      selectedGender = null;
                    });
                  }
                },
                text: 'CALCULATE YOUR BMI'),
          ],
        ));
  }
}
