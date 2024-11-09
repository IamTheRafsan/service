import 'package:flutter/material.dart';
import '../ui/Styles.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> inputValue;
  final bool obsecureText;
  final TextInputType keyboardType;

  const InputField({
    super.key,
    required this.hintText,
    required this.inputValue,
    this.obsecureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: inputValue,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Colors.transparent, // Border color when enabled (not focused)
              width: 1.0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: color.primaryColor,
              width: .5,
            ),
          ),
        ),
        style: BodyText.inputText());
  }
}

class UserUpdateInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> inputValue;
  final bool obsecureText;
  final TextInputType keyboardType;
  final int maxlines;
  final int minlines;
  final int maxlength;

  const UserUpdateInputField({
    super.key,
    required this.hintText,
    required this.inputValue,
    this.obsecureText = false,
    this.keyboardType = TextInputType.text,
    this.maxlines = 1,
    this.minlines = 1,
    this.maxlength = 50,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: inputValue,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        maxLines: maxlines,
        minLines: minlines,
        maxLength: maxlength,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: color.primaryColor,
                width: 1.5,
              )),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
        ),
        style: BodyText.inputText());
  }
}
