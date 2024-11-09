import 'package:flutter/material.dart';
import 'package:service/screens/HomeScreen.dart';
import 'package:service/screens/SearchScreen.dart';
import 'package:service/screens/SignInScreen.dart';
import 'package:service/screens/SignUpScreen.dart';
import 'package:service/ui/Styles.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: color.primaryColor,
        hintColor: color.primaryColor,
        scaffoldBackgroundColor: color.backgroundColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize:40, color: Colors.red)
        )
      ),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: color.primaryColor,
          hintColor: color.primaryColor,
          scaffoldBackgroundColor: Colors.black
      ),

      home: SignUpScreen(),
    );

  }

}

