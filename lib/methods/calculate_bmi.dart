import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;
  double? bmi_;
  CalculateBMI({
    required this.height,
    required this.weight,
  });

  String calculateBMI() {
    bmi_ = weight / pow(height / 100, 2);
    return bmi_!.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi_! >= 25) {
      return 'Ашыкча салмак';
    } else if (bmi_! > 18.5) {
      return 'Нормалдуу';
    } else {
      return 'Аз салмак';
    }
  }

  String feedBack() {
    if (bmi_! >= 25) {
      return 'Сиздин дене салмагыңыз нормадан жогору.\n Көбүрөөк машыгууга аракет кылыңыз!\n 💪🚵🚴🏊🏇🏃';
    } else if (bmi_! >= 18.5) {
      return 'Сиздин дене салмагыңыз нормалдуу.\n Азаматсыз!\n 🍇🍉🍍🍒🌽';
    } else {
      return 'Сиздин дене салмагыңыз нормадан төмөн.\n Көбүрөөк тамактаныңыз!\n 🍲🍱🍳🍗🍒🍎';
    }
  }
}
