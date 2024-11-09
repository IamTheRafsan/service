import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:service/components/reuseable_button.dart';
import 'package:service/components/reuseable_textfield.dart';
import 'package:service/screens/SignInScreen.dart';
import 'package:service/ui/Styles.dart';
import 'package:service/controllers/receiverValidation.dart';
import 'package:service/components/reuseable_dialog.dart';

class ReceiverSignUpScreen extends StatefulWidget {
  const ReceiverSignUpScreen({super.key});

  @override
  _ReceiverSignUpScreenState createState() => _ReceiverSignUpScreenState();
}

class _ReceiverSignUpScreenState extends State<ReceiverSignUpScreen> {
  String userFullName = " ";
  String userEmail = " ";
  String userPassword = " ";
  String userConfirmPassword = " ";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signUp() async {

    //Validation
    String? nameError = receiverValidation.validateName(userFullName);
    String? emailError = receiverValidation.validateEmail(userEmail);
    String? passwordError = receiverValidation.validatePassword(userPassword);
    String? confirmPasswordError = receiverValidation.validateConfirmPassword(userPassword, userConfirmPassword);
    bool emailExists = await receiverValidation.isEmailAlreadyUsed(userEmail);

    if (nameError != null) {
      CustomDialog.show(context, title: "Name Error!", message: nameError);
      return;
    }

    else if (emailError != null) {
      CustomDialog.show(context, title: "Email Error!", message: emailError);
      return;
    }

    else if (passwordError != null) {
      CustomDialog.show(context, title: "Passord Error!", message: passwordError);
      return;
    }

    else if (confirmPasswordError != null) {
      CustomDialog.show(context, title: "Confirm-Password Error!", message: confirmPasswordError);
      return;
    }

    else if (emailExists) {
      CustomDialog.show(context, title: "Email Error!", message: "Email already exits. Try a new email.");
      return;
    }

    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      await _firestore
          .collection('receiverDetails')
          .doc(userCredential.user?.uid)
          .set({
        'Name': userFullName,
        'Email': userEmail,
        'Password': userPassword
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sign-up successful!"),
        backgroundColor: Colors.green,
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign-up failed"),
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