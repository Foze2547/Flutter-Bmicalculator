import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double bmi;
  final String category;
  final String message;

  const ResultDisplay({
    Key? key,
    required this.bmi,
    required this.category,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Result: ${bmi.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          category,
          style: TextStyle(fontSize: 22, color: _getColorForBMI(bmi)),
        ),
        const SizedBox(height: 10),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Color _getColorForBMI(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi >= 18.5 && bmi < 25) return Colors.green;
    if (bmi >= 25 && bmi < 30) return Colors.orange;
    return Colors.red;
  }
}
