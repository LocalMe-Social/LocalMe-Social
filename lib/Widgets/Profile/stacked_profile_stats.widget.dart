import 'package:flutter/material.dart';

class StackedProfileStats extends StatelessWidget {
	String title;
	int stat;

	StackedProfileStats({required this.title, required this.stat});

	Widget build(BuildContext context) {
		return Container(
			width: 100,
			child: Column(
				children: [
					Text(
						stat.toString(),
						style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
					),
					Text(title),
				],
			),
		);
	}
}