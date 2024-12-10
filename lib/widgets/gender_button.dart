import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  // ใช้ตัวแปรนี้ในการเก็บค่าของเพศที่เลือก
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GenderButton(
          gender: 'Male',
          isSelected: selectedGender == 'Male', // เปรียบเทียบกับค่าที่เลือก
          onPressed: () {
            setState(() {
              selectedGender = 'Male'; // เมื่อกดเลือก Male
            });
          },
        ),
        const SizedBox(height: 20,width: 20,),
        GenderButton(
          gender: 'Female',
          isSelected: selectedGender == 'Female', // เปรียบเทียบกับค่าที่เลือก
          onPressed: () {
            setState(() {
              selectedGender = 'Female'; // เมื่อกดเลือก Female
            });
          },
        ),
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final VoidCallback onPressed;

  const GenderButton({
    Key? key,
    required this.gender,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.black // สีเมื่อเลือก
            : Colors.black38, // สีเมื่อไม่ได้เลือก
        fixedSize: Size(150, 100), // ขนาดปุ่ม (กว้าง x สูง),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // ขอบมน
        ),
      ),
      child: Text(
        gender,
        style: const TextStyle(fontSize: 26, color: Colors.white),
      ),
    );
  }
}
