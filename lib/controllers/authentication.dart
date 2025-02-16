import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:service/screens/SignInScreen.dart';

void checkAuth(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }
}
