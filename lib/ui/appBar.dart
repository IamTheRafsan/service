import 'package:flutter/material.dart';
import 'package:service/ui/Styles.dart'; // Assuming you have a color defined here

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
        style: TextStyle(
          color: Colors.white
        ),
      ),
      backgroundColor: color.primaryColor,
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}