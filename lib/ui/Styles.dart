import 'package:flutter/material.dart';


//For Colors
class color {
  static const primaryColor = Color(0xFF01623B);
  static const backgroundColor = Color(0xFFF2F2F2);
}

//For Texts
class BodyText {

  static TextStyle headingBold() {
    return const TextStyle(
      fontFamily: 'Poppins Medium',
      fontSize: 32,
      color: Colors.black,
    );
  }

  static TextStyle heading() {
    return const TextStyle(
      fontFamily: 'Poppins Medium',
      fontSize: 14,
      color: Colors.black,
    );
  }

  static TextStyle bodyText() {
    return const TextStyle(
      fontFamily: 'Poppins Regular',
      fontSize: 14,
      color: Colors.black,
    );
  }

  static TextStyle bodyTextBold() {
    return const TextStyle(
      fontFamily: 'Poppins Medium',
      fontSize: 14,
      color: Colors.black,
    );
  }

  static TextStyle headingBoldWhite() {
    return const TextStyle(
      fontFamily: 'Poppins Medium',
      fontSize: 32,
      color: Colors.white,
    );
  }

  static TextStyle headingWhite() {
    return const TextStyle(
      fontFamily: 'Poppins Medium',
      fontSize: 14,
      color: Colors.white,
    );
  }

  static TextStyle bodyTextWhite() {
    return const TextStyle(
      fontFamily: 'Poppins Regular',
      fontSize: 14,
      color: Colors.white,
    );
  }

  static TextStyle inputText() {
    return const TextStyle(
      fontFamily: 'Poppins Regular',
      fontSize: 14,
      color: Colors.black,
    );
  }
}
