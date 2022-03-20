library globals;

import 'firebaseimports.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

CollectionReference usersDB = FirebaseFirestore.instance.collection("users");

User? loggedInUser;

String? userID;

SharedPreferences? prefs;

String currentUsername = "";

String currentUserFullName = "";

Position? position;

double? postRadius = 50.0;

getLocation() async {
  position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
