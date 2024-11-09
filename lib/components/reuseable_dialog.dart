import 'package:flutter/material.dart';
import 'package:service/ui/Styles.dart';

class CustomDialog{
  static void show(
      BuildContext context, {
        required String title,
        required String message,
        Color backgroundColor = Colors.white,
      }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: BodyText.heading()),
          content: Text(message, style: BodyText.bodyText()),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK", style: TextStyle(color: color.primaryColor)),
            ),
          ],
        );
      },
    );
  }
}