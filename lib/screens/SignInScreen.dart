import 'package:flutter/material.dart';
import 'package:service/screens/SplashScreen.dart';
import '../components/reuseable_button.dart';
import '../components/reuseable_textfield.dart';
import '../ui/Styles.dart';
import 'package:service/controllers/signIn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String userEmail = " ";
  String userPassword = " ";

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
                  "Sign In",
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
                    height: 30,
                  ),
                  Row(children: [
                    Expanded(
                        child: Button(
                      onPress: () {
                        SignIn.singIn(context:context,
                          userEmail: userEmail,
                          userPassword: userPassword
                        );
                      },
                      buttonText: "Sign In",
                    ))
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Or, Create an account",
                    style: BodyText.bodyText(),

                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Expanded(
                        child: ButtonWhite(
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
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
