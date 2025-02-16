import 'package:flutter/material.dart';
import 'package:service/screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:service/controllers/signInValidation.dart';
import 'package:service/components/reuseable_dialog.dart';


class SignIn{

  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> singIn({
    required BuildContext context,
      required String userEmail,
      required String userPassword
  }) async {
    try {


      String? emailError = Validation.validateEmail(userEmail);
      if (emailError != null) {
        CustomDialog.show(context, title: "Email Error!", message: emailError);
        return;
      }

      String? passwordError = Validation.validatePassword(userPassword);
      if (passwordError != null) {
        CustomDialog.show(
            context, title: "Password Error!", message: passwordError);
        return;
      }



      await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sign-in Successful."),
        backgroundColor: Colors.green,
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(userEmail: userEmail)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign-up failed"),
        backgroundColor: Colors.red,
      ));
    }
  }

}
