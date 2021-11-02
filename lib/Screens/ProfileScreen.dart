// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/globals.dart' as globals;
import 'package:localmeapp/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "globals.currentUsername",
          style: TextStyle(color: Colors.white),
        ),
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
              CircleAvatar(
                radius: 60.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "globals.currentUserFullName",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
