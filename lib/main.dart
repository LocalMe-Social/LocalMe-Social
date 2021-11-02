import 'package:flutter/material.dart';
import 'package:localmeapp/Screens/FeedScreen.dart';
import 'package:localmeapp/Screens/HomeScreen.dart';
import 'package:localmeapp/Screens/ProfileScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/SignupScreen.dart';
import 'Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          backgroundColor: Colors.blueGrey[900],
          scaffoldBackgroundColor: Colors.blueGrey[900],
          textTheme:
              const TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle())
                  .apply(bodyColor: Colors.white, displayColor: Colors.white)),
      home: HomeScreen(),
    );
  }
}
