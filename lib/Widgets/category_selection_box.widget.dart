import 'package:flutter/material.dart';

class CategorySelectionBox extends StatelessWidget {
	String text;
	IconData icon;
	void Function(bool?)? onChanged;
	bool? value;

	CategorySelectionBox({
				required this.text,
				required this.icon,
				required this.onChanged,
				required this.value
			});

	Widget build(BuildContext context) {
		return Column(
			children: [
				Text(
					text,
					style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
				),
				const SizedBox(height: 5),
				Icon(
					icon,
					color: Colors.blueGrey,
				),
				Transform.scale(
					scale: 2.0,
					child: Checkbox(
						activeColor: Colors.blueGrey,
						shape: CircleBorder(),
						tristate: false,
						splashRadius: 30,
						onChanged: onChanged,
						value: value,
					),
				)
			],
		);
	}
}