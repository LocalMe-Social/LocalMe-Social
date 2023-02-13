import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
	@override
	State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
	Widget build(BuildContext context) {
		return const Center(
			child: Text(
				"It worked!"
			),
		);
	}
}