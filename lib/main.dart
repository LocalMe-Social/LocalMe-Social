import 'package:flutter/material.dart';
import 'package:localme_mobile/screens/HomeScreen.dart';
import 'package:localme_mobile/screens/LoginScreen.dart';
import 'package:localme_mobile/screens/ProfileScreen.dart';
import 'package:localme_mobile/screens/SignUpScreen.dart';
import 'package:localme_mobile/screens/TestScreen.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	static const MaterialColor primaryBlack = MaterialColor(
		_blackPrimaryValue,
		<int, Color>{
			50: Color(0xFF000000),
			100: Color(0xFF000000),
			200: Color(0xFF000000),
			300: Color(0xFF000000),
			400: Color(0xFF000000),
			500: Color(_blackPrimaryValue),
			600: Color(0xFF000000),
			700: Color(0xFF000000),
			800: Color(0xFF000000),
			900: Color(0xFF000000),
		},
	);
	static const int _blackPrimaryValue = 0xFF000000;

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'LocalMe',
			theme: ThemeData(
				primarySwatch: primaryBlack,
				backgroundColor: Colors.white,
				floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.white, foregroundColor: Colors.black),
				scaffoldBackgroundColor: Colors.black,
				textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white)
			),
			home: LoginScreen(),
			routes: <String, WidgetBuilder> {
				'/SignUpScreen': (BuildContext context) => SignUpScreen(),
				'/SignInScreen': (BuildContext context) => LoginScreen(),
				'/SignUpAvatarScreen': (BuildContext context) => SignUpAvatarScreen(),
				'/HomeScreen': (BuildContext context) => HomeScreen(),
				'/ProfileScreen': (BuildContext context) => ProfileScreen(),
				'/TestScreen': (BuildContext context) => TestScreen(),
			},
		);
	}
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key, required this.title});
	final String title;

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	int _counter = 0;

	void _incrementCounter() {
		setState(() {
			_counter++;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						const Text(
							'You have pushed the button this many times:',
						),
						Text(
							'$_counter',
							style: Theme.of(context).textTheme.headline4,
						),
					],
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: _incrementCounter,
				tooltip: 'Increment',
				child: const Icon(Icons.add),
			), 
		);
	}
}
