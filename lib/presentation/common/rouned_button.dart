import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';

class RounedButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  const RounedButton({super.key, required this.onPress,required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
        elevation: 5.0,
        backgroundColor:Constants.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // <-- Radius
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
