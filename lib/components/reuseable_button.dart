import 'package:flutter/material.dart';
import 'package:service/ui/Styles.dart';

class Button extends StatelessWidget{
  final String buttonText;
  final VoidCallback onPress;

  Button({
    required this.buttonText,
    required this.onPress,
});
  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: onPress,
        child: Text(buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
        ),
      );
  }

}