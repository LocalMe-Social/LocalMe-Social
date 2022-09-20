import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'globals.dart' as globals;

class CheckLogin extends StatefulWidget {
	@override
	CheckLoginState createState() => CheckLoginState();
}

class CheckLoginState extends State<CheckLogin> {
	@override
	void initState() {
			super.initState();
	}

	@override
	Widget build(BuildContext context) {
	return Scaffold(
			body: Center(
				child: CircularProgressIndicator(),
				),
			);
	}
}