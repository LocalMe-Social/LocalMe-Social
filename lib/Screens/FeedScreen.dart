// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localmeapp/globals.dart' as globals;
import '../Widgets/Feed/image_card.widget.dart';
import '../Widgets/Feed/text_card.widget.dart';

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
			floatingActionButton: FloatingActionButton(
				backgroundColor: Colors.white,
				child: Icon(Icons.add),
				onPressed: () {
					Navigator.of(context).pushNamed('/CreatePostScreen');
				},
			),
			body: Container(
			)
		);
	}
}
