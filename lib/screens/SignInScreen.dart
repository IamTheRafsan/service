import 'package:flutter/material.dart';
import 'package:service/screens/HomeScreen.dart';
import '../components/reuseable_button.dart';
import '../components/reuseable_textfield.dart';
import '../ui/Styles.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String userEmail = " ";
  String userPassword = " ";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signIn() async {
    try {
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
                    height: 15,
                  ),
                  Row(children: [
                    Expanded(
                        child: Button(
                      onPress: () {
                        _signIn();
                      },
                      buttonText: "Sign In",
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
