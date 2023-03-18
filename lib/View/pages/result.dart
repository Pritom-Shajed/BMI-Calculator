import 'package:bmi_calculator/Widget/widgets.dart';
import 'package:bmi_calculator/constant/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {Key? key,
      required this.message,
      required this.bmiReult,
      required this.bodyCondition})
      : super(key: key);
  String? bodyCondition;
  double? bmiReult;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULTOR'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'YOUR RESULT',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width / 1.2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: unselectedColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      bodyCondition.toString(),
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiReult!.toStringAsFixed(2),
                      style: textStyle,
                    ),
                    Text(
                      message.toString(),
                      style: boldText,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
                onTap: () {
                  Navigator.pop(context, 'back');
                },
                text: 'RECALCULATE'),
          ],
        ),
      ),
    );
  }
}
