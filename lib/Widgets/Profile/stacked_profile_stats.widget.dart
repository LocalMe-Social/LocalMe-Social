import 'package:flutter/material.dart';

class StackedProfileStats extends StatelessWidget {
	String title;
	int stat;

	StackedProfileStats({required this.title, required this.stat});

	Widget build(BuildContext context) {
		return Column(
			children: [
				Text(title),
				Text(
					stat.toString(),
					style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
				)
			],
		);
	}
}