import 'package:flutter/material.dart';
import 'package:service/ui/Styles.dart';

class Button extends StatelessWidget{
  final String buttonText;

  Button({
    required this.buttonText,
});
  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: () {  },
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