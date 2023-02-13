import 'package:flutter/material.dart';
import 'package:localme_mobile/widgets/rounded_button.widget.dart';
import 'package:localme_mobile/widgets/rounded_icon_button.widget.dart';
import 'package:localme_mobile/widgets/rounded_text_field.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localme_mobile/services/users.service.dart' as Users;

class LoginScreen extends StatefulWidget {
	@override
	State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	TextEditingController emailContoller = TextEditingController();
	TextEditingController passwordContoller = TextEditingController();
	bool saveLogin = false;

	checkLogin() async {
		final prefs = await SharedPreferences.getInstance();
		final email = prefs.getString('email');
		final password = prefs.getString('password');
		if(email != null && password != null) {
			await Users.login(email, password);
			Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
		}
	}

	@override
	void initState() {
		checkLogin();
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
						children: [
							const SizedBox(height: 150),
							const Text('LocalMe', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'Lobster')),
							const SizedBox(height: 150),
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
								controller: passwordContoller, 
								obscureText: true,
								textBoxWidth: MediaQuery.of(context).size.width-10,
								hintText: 'Password',
								icon: Icons.lock,
							),
							const SizedBox(height: 60),
							RoundedIconButton(
								icon: Icons.arrow_forward,
								onPressed: () async {
									final prefs = await SharedPreferences.getInstance();
									if(saveLogin) {
										prefs.setString('email', emailContoller.text);
										prefs.setString('password', passwordContoller.text);
									}
									var responseCode = await Users.login(emailContoller.text, passwordContoller.text);
									if(responseCode == 201) {
										Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
									} else {
										print("Incorrect Login");
									}
								}
							),
							const SizedBox(height: 20),
							Row(
								children: [
									const Text("Stay Signed In?"),
									Checkbox(
										checkColor: Colors.black,
										fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
											if (states.contains(MaterialState.disabled)) {
												return Colors.white.withOpacity(.32);
												}
												return Colors.white;
											}),
										value: saveLogin,
										onChanged: (bool? value) {
											setState(() {
											  saveLogin = value!;
											});
										},
									),
								],
							),
							const SizedBox(height: 25),
							RoundedButton(
								text: 'Create Account',
								onPressed: () {
									Navigator.of(context).pushNamed('/SignUpScreen');
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
