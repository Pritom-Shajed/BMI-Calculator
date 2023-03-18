import 'package:bmi_calculator/constant/constants.dart';
import 'package:flutter/material.dart';

//Gender Card
Widget GenderCard(
    {required IconData icon,
    required Color color,
    required String text,
    required VoidCallback onTap,
    required BuildContext context}) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(20),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

Widget ReusableWidget(
    {required String titleText,
    required valueText,
    required VoidCallback plusTap,
    required VoidCallback minusTap}) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.black54, borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          valueText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: minusTap,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.remove,
                  size: 25,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: plusTap,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add,
                  size: 25,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget CustomButton({required VoidCallback onTap, required String text}) {
  return Container(
      margin: EdgeInsets.all(8),
      width: double.maxFinite,
      child: ElevatedButton(onPressed: onTap, child: Text(text)));
}
