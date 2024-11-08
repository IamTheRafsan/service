import 'package:flutter/material.dart';
import '../ui/Styles.dart';

class InputField extends StatelessWidget{
  final String hintText;

  InputField({
    required this.hintText,
});


  @override
  Widget build(BuildContext context) {
      return TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 16
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0
              )
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: color.primaryColor,
              width: 1.5,
            ),
          ),
        ),
        style: TextStyle(
            fontSize: 16
        ),
      );
    }
  }