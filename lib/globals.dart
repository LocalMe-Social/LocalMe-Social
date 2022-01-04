library globals;

import 'firebaseimports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

CollectionReference usersDB = FirebaseFirestore.instance.collection("Users");

User? loggedInUser;

SharedPreferences? prefs;

String currentUsername = "";

String currentUserFullName = "";

Position? position;

getLocation() async {
  position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
