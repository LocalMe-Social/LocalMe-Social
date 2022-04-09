import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/rounded_button.widget.dart';
import '../Widgets/rounded_text_field.widget.dart';
import '../globals.dart' as globals;
import '../Widgets/logo.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
	TextEditingController _emailController = TextEditingController();
	TextEditingController _passwordController = TextEditingController();
	var _email;
	var _password;
	bool staySignedIn = false;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
						children: [
							const SizedBox(height: 100.0),
							LogoWidget(logoWidth: 120, logoHeight: 120),
							const SizedBox(height: 30.0),
							Row(
								children: const [
									Text(
										"Welcome to ",
										style: TextStyle(
											fontSize: 30.0,
											fontWeight: FontWeight.bold
										),
									),
									Text(
										"LocalMe",
										style: TextStyle(
											fontSize: 30.0,
											fontFamily: 'Lobster'
										),
									)
								],
							),
							const SizedBox(height: 20.0),
							const Text(
								"Enter your info to Login",
								style: TextStyle(
									fontSize: 25.0,
									fontWeight: FontWeight.bold
								),
							),
							const SizedBox(height: 20.0),
							RoundedTextField(
								textBoxWidth: MediaQuery.of(context).size.width-80, 
								controller: _emailController,
								maxLines: 1,
								icon: Icons.email,
							),
							const SizedBox(height: 20.0),
							RoundedTextField(
								textBoxWidth: MediaQuery.of(context).size.width-80, 
								controller: _passwordController,
								obscureText: true,
								maxLines: 1,
								icon: Icons.lock,
							),
							Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Checkbox(
										value: staySignedIn,
										onChanged: (bool? value) {
											setState(() {
												staySignedIn = value!;
											});
										},
									),
									const Text("Stay Signed In?")
								],
							),
							const SizedBox(height: 30.0),
							InkWell(
								child: CircleAvatar(
									minRadius: 30.0,
									child: Icon(Icons.arrow_forward),
								),
								onTap: () async {
									try {
										UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
											email: _emailController.text,
											password: _passwordController.text
										);
										if(staySignedIn == true) {
											SharedPreferences prefs = await SharedPreferences.getInstance();
											prefs.setString('uid', userCredential.user!.uid);
										}
										globals.userID = userCredential.user!.uid;
										Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
									} on FirebaseAuthException catch (e) {
										if (e.code == 'weak-password') {
											print('The password provided is too weak.');
										} else if (e.code == 'email-already-in-use') {
											print('The account already exists for that email.');
										}
									} catch (e) {
										print(e);
									}
								}
							),
							const SizedBox(height: 30),
							RoundedButton(
								text: "Sign Up", 
								onPressed: () {
									Navigator.of(context).pushNamedAndRemoveUntil('/SignUpScreen', (route) => false);
								}
							)
						],
					)
				],
			),
		);
	}
}
