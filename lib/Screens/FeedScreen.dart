// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';

class FeedScreen extends StatefulWidget {
  @override
  FeedScreenState createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          "LocalMe",
          style: TextStyle(
              fontFamily: 'Lobster', color: Colors.white, fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          TextCard(
            posterName: "Liam Earle",
            postText: "Hello",
            postType: "People",
          ),
          ImageCard(
            posterName: "Liam Earle",
            postText: "Hello",
            postType: "People",
          ),
          TextCard(
            posterName: "Liam Earle",
            postText: "Hello",
            postType: "People",
          ),
          TextCard(
            posterName: "Liam Earle",
            postText: "Hello",
            postType: "People",
          ),
          TextCard(
            posterName: "Liam Earle",
            postText: "Hello",
            postType: "People",
          ),
          TextCard(
            posterName: "Liam Earle",
            postText: "Hello",
            postType: "People",
          ),
        ],
      ),
    );
  }
}
