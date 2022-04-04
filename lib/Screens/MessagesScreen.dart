// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';

class MessagesScreen extends StatefulWidget {
	@override
	MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			floatingActionButton: FloatingActionButton(
				backgroundColor: Colors.blueGrey[600],
				child: Icon(Icons.create),
				onPressed: () {},
			),
			appBar: AppBar(
				backgroundColor: Colors.blueGrey[900],
				title: Text(
					"Messages",
					style: TextStyle(color: Colors.white),
				),
			),
			body: ListView(
				children: [
					MessageCard(
						name: "Liam Earle",
						recentMessage: "Hello there!",
					)
				],
			),
		);
	}
}
