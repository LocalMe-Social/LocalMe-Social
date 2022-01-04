// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localmeapp/globals.dart' as globals;

import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';

class CheckLogin extends StatefulWidget {
  @override
  _CheckLoginState createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  void _checkLoginState() async {
    globals.prefs = await SharedPreferences.getInstance();
    Object? email = globals.prefs!.get("Email");
    Object? password = globals.prefs!.get("Password");
    if (email == null || email == "") {
      if (password == null || password == "") {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new LoginScreen()));
      }
    } else {
      try {
        final firebaseUser = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.toString(), password: password.toString());
        globals.loggedInUser = firebaseUser.user;
        if (globals.loggedInUser!.emailVerified == true) {
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new LoginScreen()));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLoginState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()));
  }
}
