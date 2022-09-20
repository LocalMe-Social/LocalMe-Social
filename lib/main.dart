import 'package:flutter/material.dart';
import 'package:localmeapp/Screens/FeedScreen.dart';
import 'package:localmeapp/Screens/HomeScreen.dart';
import 'package:localmeapp/Screens/ProfileScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/SignupScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/CreatePostScreen.dart';
import 'checkLogin.dart';
import 'firebaseimports.dart';
import 'firebase_options.dart';
import 'globals.dart' as globals;

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
	await globals.getLocation();
	runApp(LocalMe());
}

class LocalMe extends StatelessWidget {
	const LocalMe({Key? key}) : super(key: key);

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
		return GestureDetector(
			onTap: () {
				FocusScopeNode currentFocus = FocusScope.of(context);
				if(!currentFocus.hasPrimaryFocus) {
					currentFocus.unfocus();
				}
			},
			child: MaterialApp(
				title: 'LocalMe',
				theme: ThemeData(
						primarySwatch: Colors.grey,
						backgroundColor: primaryBlack,
						scaffoldBackgroundColor: primaryBlack,
						textTheme:
								const TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle())
										.apply(bodyColor: Colors.white, displayColor: Colors.white)),
				home: CheckLogin(),
				routes: <String, WidgetBuilder>{
					'/HomeScreen': (BuildContext context) => HomeScreen(),
					'/SignUpScreen': (BuildContext context) => const SignUpScreen(),
					'/SignUpInfoScreen': (BuildContext context) => const SignUpInfoScreen(),
					'/SignUpPasswordScreen': (BuildContext context) => const SignUpPasswordScreen(),
					'/SignUpAvatarScreen': (BuildContext context) => const SignUpAvatarScreen(),
					'/LoginScreen': (BuildContext context) => const LoginScreen(),
					'/CreatePostScreen': (BuildContext context) => CreatePostScreen(),
					'/PostOptionsScreen': (BuildContext context) => PostOptionsScreen(),
				}
			)
		);
	}
}
