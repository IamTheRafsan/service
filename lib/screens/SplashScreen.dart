import 'package:flutter/material.dart';
import 'package:service/ui/Styles.dart';
import 'package:service/components/reuseable_button.dart';
import 'package:service/screens/ReceiverSignUpScreen.dart';
import 'package:service/screens/ProviderSignUpScreen.dart';


class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250),
                bottomRight: Radius.circular(250)
              )
            ),
            child: Center(
              child: Image.asset('images/logo.png',
                height: 120,
                width: 120,
              ),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 30),
            child: ButtonWhite(
              buttonText: 'I am a service Seeker',
              onPress:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReceiverSignUpScreen()));
              } ,
          ),),
          SizedBox(
            height: 30,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 30),
            child: Button(
              buttonText: 'I am a service Provider',
              onPress:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderSignUpScreen()));
              } ,
          ),)

        ],
      ),
            
    );
  }

}