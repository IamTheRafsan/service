import 'package:flutter/material.dart';
import 'package:service/components/reuseable_button.dart';
import 'package:service/components/reuseable_textfield.dart';
import 'package:service/ui/Styles.dart';
import 'package:service/controllers/receiverSignUp.dart';

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
                            receiverSignUp.signUp(context: context,
                                userFullName: userFullName,
                                userEmail: userEmail,
                                userPassword: userPassword,
                                userConfirmPassword: userConfirmPassword);
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