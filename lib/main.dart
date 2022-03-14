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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalMe',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          backgroundColor: Colors.blueGrey[900],
          scaffoldBackgroundColor: Colors.blueGrey[900],
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
      }
    );
  }
}
