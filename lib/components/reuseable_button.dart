import 'package:flutter/material.dart';
import 'package:service/ui/Styles.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPress;

  const Button({
    super.key,
    required this.buttonText,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: color.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}


//White button with black text
class ButtonWhite extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPress;

  const ButtonWhite({
    super.key,
    required this.buttonText,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
