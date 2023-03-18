import 'dart:math';

class bmiModel {
  int? _height;
  int? _weight;
  double? _bmiResult;

  bmiModel({required int height, required int weight}) {
    _weight = weight;
    _height = height;
    _bmiResult = _weight! / pow(_height! / 100, 2);
  }

  getBmiResult() {
    return _bmiResult;
  }

  String getBodyCondition() {
    if (_bmiResult! <= 18.5) {
      return 'Underweight';
    } else if (_bmiResult! > 18.5 && _bmiResult! < 25.0) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  String getMessage() {
    if (_bmiResult! <= 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more!!!!';
    } else if (_bmiResult! > 18.5 && _bmiResult! < 25.0) {
      return 'You have a normal body. Great Job!!';
    } else {
      return 'You have a higher than normal body weight. Try to exercise more!!!!';
    }
  }
}
