// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';
import 'package:localmeapp/globals.dart' as globals;

import 'package:localmeapp/firebaseimports.dart';

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

  //SignUp Variables
  late String _username;
  late String _email;
  late String _password;
  late String _confirmPassword;

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
                  onPressed: () async {
                    //Setting SignUp Variables to Entered Values
                    _username = _usernameController.text;
                    _email = _emailController.text;
                    _password = _passwordController.text;
                    _confirmPassword = _confirmPasswordController.text;

                    //Checking for required fields
                    if (_email == '' ||
                        _username == '' ||
                        _password == '' ||
                        _confirmPassword == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                        children: const [
                          Icon(Icons.error),
                          Text(' Enter Required Fields')
                        ],
                      )));
                    } else if (_password != _confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                        children: const [
                          Icon(Icons.error),
                          Text(' Enter Required Fields')
                        ],
                      )));
                    }

                    //Create User
                    final firebaseUser = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _email, password: _password);

                    //User Database
                    globals.usersDB.doc(firebaseUser.user!.uid).set({
                      "UID": firebaseUser.user!.uid,
                      "Username": _username,
                      "Email": firebaseUser.user!.email
                    });
                    globals.usersDB
                        .doc(firebaseUser.user!.uid)
                        .collection("Friends");

                    //Add user to Globals
                    globals.loggedInUser = firebaseUser.user;
                    globals.currentUsername = _username;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 3),
                        content: Row(
                          children: <Widget>[
                            CircularProgressIndicator(),
                            Text("    Sending Verification Email")
                          ],
                        ),
                      ),
                    );

                    await Future.delayed(const Duration(seconds: 3));
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/homescreen', (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
