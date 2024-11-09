import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:service/components/reuseable_button.dart';
import 'package:service/components/reuseable_textfield.dart';
import 'package:service/ui/Styles.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();



}
  class _SignUpScreenState extends State<SignUpScreen>{

    String userFullName = " ";
    String userEmail = " ";
    String userPassword = " ";
    String userConfirmPassword = " ";

    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> _signUp() async {
      if (userPassword != userConfirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.red,
        ));
        return;
      }
      try {
        await _auth.createUserWithEmailAndPassword(
          email: userEmail,
          password: userPassword,
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sign-up successful!"),
          backgroundColor: Colors.green,
        ));
        // Optionally, navigate to another screen after successful sign-up
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sign-up failed: ${e.toString()}"),
          backgroundColor: Colors.red,
        ));
      }
    }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: BodyText.headingBlack(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        Expanded(child: InputField(
                          inputValue: (value){setState(() {
                            userFullName = value;
                          });},
                          hintText: "Full Name",))
                      ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        Expanded(child: InputField(
                          inputValue: (value){setState(() {
                            userEmail = value;
                          });}, hintText: "E-mail",))
                      ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        Expanded(child: InputField(
                          inputValue: (value){setState(() {
                            userPassword = value;
                          });}, hintText: "Password",))
                      ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        Expanded(child: InputField(
                          inputValue: (value){setState(() {
                            userConfirmPassword = value;
                          });},
                          hintText: "Confirm Password",))
                      ]
                  ),
                  SizedBox(height: 15,),
                  Row(
                      children: [
                        Expanded(child: Button(
                          onPress: () {
                            _signUp();
                          },
                          buttonText: "Sign Up",))
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}