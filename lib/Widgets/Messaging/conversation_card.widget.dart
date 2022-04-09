import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
	String name;
	String recentMessage;

	MessageCard({required this.name, required this.recentMessage});

	@override
  	Widget build(BuildContext context) {
		return Card(
			color: Colors.blueGrey[800],
			child: Row(
				children: [
					const SizedBox(
						width: 10.0,
						height: 70.0
					),
					const CircleAvatar(radius: 25.0),
					const SizedBox(width: 10.0),
					Column(
						children: [
							Text(
								name,
								style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
							),
							Text(recentMessage)
						],
					)
				]
			),
		);
	}
}