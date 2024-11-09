import 'package:flutter/material.dart';
import 'package:service/components/reuseable_textfield.dart';
import 'package:service/ui/Styles.dart';

import '../components/reuseable_button.dart';

class UserUpdateScreen extends StatefulWidget {
  const UserUpdateScreen({super.key});

  @override
  _UserUpdateScreenState createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
  String userFullName = " ";
  String userEmail = " ";
  String userPassword = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Update Profile Info",
                  style: BodyText.heading(),
                )
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Full Name:",
                style: BodyText.bodyTextBold(),
              ),
              const SizedBox(
                height: 10,
              ),
              UserUpdateInputField(
                inputValue: (value) {
                  setState(() {
                    userFullName = value;
                  });
                },
                hintText: "Full Name",
              ),

              //SizedBox(height: 10,),
              Text(
                "Mobile:",
                style: BodyText.bodyTextBold(),
              ),
              const SizedBox(
                height: 10,
              ),
              UserUpdateInputField(
                inputValue: (value) {
                  setState(() {
                    userFullName = value;
                  });
                },
                hintText: "Mobile",
                maxlength: 11,
              ),

              //SizedBox(height: 10,),
              Text(
                "Email:",
                style: BodyText.bodyTextBold(),
              ),
              const SizedBox(
                height: 10,
              ),
              UserUpdateInputField(
                inputValue: (value) {
                  setState(() {
                    userFullName = value;
                  });
                },
                hintText: "E-mail",
              ),

              //SizedBox(height: 10,),
              Text(
                "Location:",
                style: BodyText.bodyTextBold(),
              ),
              const SizedBox(
                height: 10,
              ),
              UserUpdateInputField(
                inputValue: (value) {
                  setState(() {
                    userFullName = value;
                  });
                },
                hintText: "Location",
                maxlength: 100,
                maxlines: 2,
              ),

              //SizedBox(height: 10,),
              Text(
                "Category:",
                style: BodyText.bodyTextBold(),
              ),
              const SizedBox(
                height: 10,
              ),
              UserUpdateInputField(
                inputValue: (value) {
                  setState(() {
                    userFullName = value;
                  });
                },
                hintText: "Category",
              ),

              //SizedBox(height: 10,),
              Text(
                "Service Title:",
                style: BodyText.bodyTextBold(),
              ),
              const SizedBox(
                height: 10,
              ),
              UserUpdateInputField(
                inputValue: (value) {
                  setState(() {
                    userFullName = value;
                  });
                },
                hintText: "Service Title",
                maxlines: 2,
              ),

              //SizedBox(height: 10,),
              Text(
                "Description:",
                style: BodyText.bodyTextBold(),
              ),
              const SizedBox(
                height: 10,
              ),
              UserUpdateInputField(
                inputValue: (value) {
                  setState(() {
                    userFullName = value;
                  });
                },
                hintText: "Description",
                minlines: 4,
                maxlines: 20,
                maxlength: 1000,
              ),

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Button(
                  onPress: () {},
                  buttonText: "Update",
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ]),
          ],
        ),
      ),
    ));
  }
}
