import 'dart:math';


class CalculateBrain {
  CalculateBrain( {required this.height, required this.weight});
  final int height;
  final int weight;
  late double _bmi;

  String calculateBmi () {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String resultBMI () {
    if (_bmi >= 25) {
      return "Жирдяяяй";
    } else {
      if (_bmi < 18) {
        return "Дрыщщщщщ";

      } else {
        return "Норм";
      }
    }
  }

  String infoBMI () {
    if (_bmi >= 25) {
      return "Нужно срочно начать бегать и худеть";
    } else {
      if (_bmi < 18) {
        return "Нужно начать кушать гамбургеры и сосиски";

      } else {
        return "Ничего не нужно делать вы прекрасны";
      }
    }
  }

}