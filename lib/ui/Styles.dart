import 'package:flutter/material.dart';

class color{
  static const primaryColor = Color(0xFF01623B);
  static const backgroundColor = Color(0xFFF2F2F2);
}

class BodyText{

  static TextStyle heading(){
    return TextStyle(
        fontFamily: 'Poppins Medium',
        fontSize: 32,
        color: Colors.white,
    );
  }

  static TextStyle headingBlack(){
    return TextStyle(
      fontFamily: 'Poppins Medium',
      fontSize: 32,
      color: Colors.black,
    );
  }

  static TextStyle headingSmall(){
    return TextStyle(
        fontFamily: 'Poppins Medium',
        fontSize: 18,
        color: Colors.white,
      );
  }

  static TextStyle headingBold(){
    return TextStyle(
        fontFamily: 'Poppins Bold',
        fontSize: 35,
        color: Colors.white,
    );
  }

  static TextStyle subHeading(){
    return TextStyle(
        fontFamily: 'Poppins Regular',
        fontSize: 16,
        color: Colors.white,
    );
  }

  static TextStyle bodyText(){
    return TextStyle(
        fontFamily: 'Poppins Regular',
        fontSize: 14,
        color: Colors.black,
      );
  }

  static TextStyle bodyTextBold(){
    return TextStyle(
      fontFamily: 'Poppins SemiBold',
      fontSize: 14,
      color: Colors.black,
    );
  }
}