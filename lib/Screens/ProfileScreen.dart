// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:localmeapp/globals.dart' as globals;
import '../Widgets/Profile/stacked_profile_stats.widget.dart';

class ProfileScreen extends StatefulWidget {
	@override
	ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("username"),
				backgroundColor: Colors.blueGrey[900],
			),
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
						children: [
							const SizedBox(
								height: 50.0,
							),
							Container(
									width: 150,
									height: 150,
									decoration: const BoxDecoration(
										color: Colors.grey,
										borderRadius: BorderRadius.all(Radius.circular(80))
									),
									child: ClipRRect(
											borderRadius: const BorderRadius.all(Radius.circular(80)),
											child: FittedBox(
												fit: BoxFit.cover,
											)
										),
								),
							const SizedBox(
								height: 20.0,
							),
							const SizedBox(height: 10.0),
							Row(children: [
								StackedProfileStats(title: "Posts", stat: 10),
								const VerticalDivider(
									color: Colors.white,
								),
								StackedProfileStats(title: "Friends", stat: 10),
								const VerticalDivider(
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
