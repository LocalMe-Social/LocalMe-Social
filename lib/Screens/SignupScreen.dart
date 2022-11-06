import 'package:flutter/material.dart';
import 'package:localme_mobile/widgets/rounded_button.widget.dart';
import 'package:localme_mobile/widgets/rounded_icon_button.widget.dart';
import 'package:localme_mobile/widgets/rounded_text_field.widget.dart';
import 'package:localme_mobile/services/users.service.dart' as Users;

class SignUpScreen extends StatefulWidget {
	@override
	State<SignUpScreen> createState() => _SignUpScreenState();
}

class SignUpAvatarScreen extends StatefulWidget {
	@override
	State<SignUpAvatarScreen> createState() => _SignUpAvatarScreenState();
}

TextEditingController emailContoller = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController fullnameContoller = TextEditingController();
TextEditingController passwordContoller = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
						children: [
							const SizedBox(height: 150),
							const Text('LocalMe', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
							const SizedBox(height: 60),
							RoundedTextField(
								maxLines: 1,
								controller: emailContoller, 
								textBoxWidth: MediaQuery.of(context).size.width-10,
								hintText: 'E-Mail',
								icon: Icons.mail,
							),
							const SizedBox(height: 10),
							RoundedTextField(
								maxLines: 1,
								controller: usernameController, 
								textBoxWidth: MediaQuery.of(context).size.width-10,
								hintText: 'Username',
								icon: Icons.person,
							),
							const SizedBox(height: 10),
							RoundedTextField(
								maxLines: 1,
								controller: fullnameContoller, 
								textBoxWidth: MediaQuery.of(context).size.width-10,
								hintText: 'Full Name',
								icon: Icons.person,
							),
							const SizedBox(height: 10),
							RoundedTextField(
								maxLines: 1,
								controller: passwordContoller, 
								obscureText: true,
								textBoxWidth: MediaQuery.of(context).size.width-10,
								hintText: 'Password',
								icon: Icons.lock,
							),
							const SizedBox(height: 60),
							RoundedIconButton(
								icon: Icons.arrow_forward,
								onPressed: () {
									Navigator.of(context).pushNamed('/SignUpAvatarScreen');
								}
							),
							const SizedBox(height: 50),
							RoundedButton(
								text: "Sign In",
								onPressed: () {
									Navigator.of(context).pushNamed('/SignInScreen');
								},
								height: 40,
								width: 130
							)
						],
					)
				]
			),
		);
	}
}

class _SignUpAvatarScreenState extends State<SignUpAvatarScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
						children: [
							const SizedBox(height: 150),
							const Text('LocalMe', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
							const SizedBox(height: 60),
							const CircleAvatar(
								radius: 80,
								backgroundColor: Colors.grey,
								child: Icon(Icons.person, size: 120)
							),
							const SizedBox(height: 60),
							RoundedIconButton(
								icon: Icons.arrow_forward,
								onPressed: () {
									Users.signup(emailContoller.text, usernameController.text, fullnameContoller.text, passwordContoller.text);
									Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
								}
							),
							const SizedBox(height: 50),
						],
					)
				]
			),
		);
	}
}