import 'package:class_f_story/_core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final click;

  const CustomElevatedButton({
    required this.text,
    required this.click,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white12),
      onPressed: click,
      child: Text('$text'),
    );
  }
}
