import 'package:flutter/material.dart';
import '../widgets/gender_button.dart';
import '../widgets/number_card.dart';
import '../widgets/result_display.dart';
import '../utils/bmi_calculator_logic.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 170.0;
  int weight = 60;
  int age = 20;
  double bmi = 0;
  String bmiResult = '';
  String bmiMessage = '';

  void calculateBMI() {
    setState(() {
      final result = BMICalculatorLogic.calculateBMI(height, weight);
      bmi = result['bmi'];
      bmiResult = result['category'];
      bmiMessage = result['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const GenderSelection(),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                //border: Border.all(
                //color: Colors.grey, width: 2), // สีและความหนาของกรอบ
                borderRadius: BorderRadius.circular(8), // มุมมนของกรอบ
              ),
              padding: EdgeInsets.all(16), // ระยะห่างภายในกรอบ
              child: Column(
                mainAxisSize: MainAxisSize.min, // ขนาดให้พอดีกับเนื้อหา
                crossAxisAlignment:
                    CrossAxisAlignment.start, // จัดข้อความชิดซ้าย
                children: [
                  Center(
                    child: Text(
                      'Height',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Text(
                      ' ${height.toStringAsFixed(1)} cm',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 220,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberCard(
                  label: 'Weight',
                  value: weight,
                  onAdd: () => setState(() => weight++),
                  onRemove: () => setState(() => weight--),
                ),
                NumberCard(
                  label: 'Age',
                  value: age,
                  onAdd: () => setState(() => age++),
                  onRemove: () => setState(() => age--),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (bmi > 0)
              ResultDisplay(bmi: bmi, category: bmiResult, message: bmiMessage),
          ],
        ),
      ),
    );
  }
}
