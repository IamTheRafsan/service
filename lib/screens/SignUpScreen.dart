import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:service/components/reuseable_button.dart';
import 'package:service/components/reuseable_textfield.dart';
import 'package:service/screens/SignInScreen.dart';
import 'package:service/ui/Styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String userFullName = " ";
  String userEmail = " ";
  String userPassword = " ";
  String userConfirmPassword = " ";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signUp() async {
    if (userPassword != userConfirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Passwords do not match"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      await _firestore
          .collection('userDetails')
          .doc(userCredential.user?.uid)
          .set({
        'fullName': userFullName,
        'email': userEmail,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sign-up successful!"),
        backgroundColor: Colors.green,
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
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
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: BodyText.headingBold(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                      inputValue: (value) {
                        setState(() {
                          userFullName = value;
                        });
                      },
                      hintText: "Full Name",
                    ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                      inputValue: (value) {
                        setState(() {
                          userEmail = value;
                        });
                      },
                      hintText: "E-mail",
                      keyboardType: TextInputType.emailAddress,
                    ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                      inputValue: (value) {
                        setState(() {
                          userPassword = value;
                        });
                      },
                      hintText: "Password",
                      obsecureText: true,
                    ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                      inputValue: (value) {
                        setState(() {
                          userConfirmPassword = value;
                        });
                      },
                      hintText: "Confirm Password",
                      obsecureText: true,
                    ))
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    Expanded(
                        child: Button(
                      onPress: () {
                        _signUp();
                      },
                      buttonText: "Sign Up",
                    ))
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
