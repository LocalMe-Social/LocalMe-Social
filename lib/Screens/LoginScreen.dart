// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //Text Field Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _email;
  var _password;
  bool rememberMe = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext? get loginButtonContext => null;

  void _rememberLogin() async {
    if (rememberMe == true) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("Email", _email);
      prefs.setString("Password", _password);
    }
  }

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
                  hintText: "Password",
                  textBoxWidth: 350.0,
                  controller: _passwordController,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedButton(
                  text: 'Login',
                  height: 55,
                  width: 350.0,
                  onPressed: () {},
                ),
                Row(
                  children: [
                    const Text("Remember Me"),
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: Checkbox(
                          value: rememberMe,
                          hoverColor: Colors.white,
                          onChanged: (var value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          }),
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
