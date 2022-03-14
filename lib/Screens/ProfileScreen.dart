// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/firebaseimports.dart';
import 'package:localmeapp/globals.dart' as globals;
import 'package:localmeapp/widgets.dart';
import 'package:localmeapp/get.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetTextFrom(FirebaseFirestore.instance.collection('users'), globals.userID!, 'Username',TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(80))
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: GetImageFrom(FirebaseFirestore.instance.collection('users'), globals.userID!, 'ProfilePictureURL'),
                      )
                    ),
                ),
              SizedBox(
                height: 20.0,
              ),
              GetTextFrom(FirebaseFirestore.instance.collection('users'), globals.userID!, 'FullName', TextStyle(color: Colors.white, fontSize: 25.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Row(children: [
                StackedProfileStats(title: "Posts", stat: 10),
                VerticalDivider(
                  color: Colors.white,
                ),
                StackedProfileStats(title: "Friends", stat: 10),
                VerticalDivider(
                  color: Colors.white,
                ),
                StackedProfileStats(title: "Likes", stat: 10),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
