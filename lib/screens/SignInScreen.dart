import 'package:flutter/material.dart';

import '../components/reuseable_button.dart';
import '../components/reuseable_textfield.dart';
import '../ui/Styles.dart';

class SignInScreen extends StatelessWidget{
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
                  "Sign In",
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
                        Expanded(child: InputField(hintText: "E-mail",))
                      ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        Expanded(child: InputField(hintText: "Password",))
                      ]
                  ),
                  SizedBox(height: 15,),
                  Row(
                      children: [
                        Expanded(child: Button(buttonText: "Sign In",))
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