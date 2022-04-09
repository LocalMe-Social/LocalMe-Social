import 'package:flutter/material.dart';
import 'firebaseimports.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'globals.dart' as globals;

class CheckLogin extends StatefulWidget {
	@override
	CheckLoginState createState() => CheckLoginState();
}

class CheckLoginState extends State<CheckLogin> {
	Stream documentStream = FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

	void checkLoginState() async {
	final prefs = await SharedPreferences.getInstance();
	Stream documentStream = FirebaseFirestore.instance.collection('users').doc(prefs.getString('uid')).snapshots();

	if (prefs.containsKey('uid')) {
		globals.userID = prefs.getString('uid');
		Navigator.pushReplacement(context,
			MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
	} else {
		Navigator.pushReplacement(context,
			MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
	}
}

	@override
	void initState() {
			super.initState();
			checkLoginState();
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