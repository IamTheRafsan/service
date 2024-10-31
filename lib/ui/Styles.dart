import 'package:flutter/material.dart';

class color{
  static const primaryColor = Color(0xFF007FFF);
  static const backgroundColor = Color(0xFFE6F4FF);
}

class BodyText{

  static TextStyle heading(){
    return TextStyle(
        fontFamily: 'Poppins Medium',
        fontSize: 32,
        color: Colors.white,
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