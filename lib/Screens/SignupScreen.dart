// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  //Text Field Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  var _email;
  var _password;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                LogoWidget(logoWidth: 250.0, logoHeight: 250.0),
                RoundedTextField(
                  hintText: "Email",
                  textBoxWidth: 350.0,
                  controller: _emailController,
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedTextField(
                  hintText: "Username",
                  textBoxWidth: 350.0,
                  controller: _usernameController,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedTextField(
                  hintText: "Password",
                  textBoxWidth: 350.0,
                  controller: _passwordController,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedTextField(
                  hintText: "Confirm Password",
                  textBoxWidth: 350.0,
                  controller: _confirmPasswordController,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedButton(
                  text: 'Sign Up',
                  height: 55,
                  width: 350.0,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ));
  }
}
