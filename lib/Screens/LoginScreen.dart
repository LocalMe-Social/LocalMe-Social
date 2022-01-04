// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:localmeapp/globals.dart' as globals;

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext? get loginButtonContext => null;

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
                  onPressed: () async {
                    _email = _emailController.text;
                    _password = _passwordController.text;

                    try {
                      UserCredential firebaseUser = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                      print("Test");
                      if (firebaseUser.user!.emailVerified == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            content: Row(
                              children: <Widget>[
                                CircularProgressIndicator(),
                                Text("   Logging In....")
                              ],
                            ),
                          ),
                        );
                        globals.loggedInUser = firebaseUser.user;

                        await Future.delayed(const Duration(seconds: 2));
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/homescreen', (Route<dynamic> route) => false);
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => SimpleDialog(
                            title: Text("Your email address is not verified"),
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, top: 16.0, bottom: 16.0),
                                    child: Text(
                                        "Would you like another verification email to be sent?"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No"),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      firebaseUser.user!
                                          .sendEmailVerification();
                                      Navigator.pop(context);
                                    },
                                    child: Text("Yes"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      print("Test1");
                      final snackBar = SnackBar(
                        content: Text("Email or Password incorrect"),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                        duration: Duration(seconds: 3),
                      );
                      Scaffold.of(loginButtonContext!).showSnackBar(snackBar);
                    }
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
