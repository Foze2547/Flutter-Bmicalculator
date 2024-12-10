class BMICalculatorLogic {
  static Map<String, dynamic> calculateBMI(double height, int weight) {
    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    String category;
    String message;

    if (bmi < 18.5) {
      category = 'Underweight';
      message = 'You have a lower than normal body weight.';
    } else if (bmi >= 18.5 && bmi < 25) {
      category = 'Normal';
      message = 'You have a normal body weight. Good job!';
    } else if (bmi >= 25 && bmi < 30) {
      category = 'Overweight';
      message = 'You have a higher than normal body weight.';
    } else {
      category = 'Obese';
      message = 'Please take care of your health!';
    }

    return {'bmi': bmi, 'category': category, 'message': message};
  }
}
