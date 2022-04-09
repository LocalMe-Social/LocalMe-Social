import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
	String hintText;
	double textBoxWidth;
	double circularRadius;
	TextEditingController controller;
	IconData? icon;
	String? prefixText;
	bool obscureText;
	int? maxLines;
	int? maxLength;

	RoundedTextField({
		this.hintText = "",
		required this.textBoxWidth,
		this.circularRadius = 20.0,
		required this.controller,
		this.icon,
		this.prefixText,
		this.obscureText = false,
		this.maxLines,
		this.maxLength
		});

	Widget build(BuildContext context) {
		iconCheck(icon) {
			if (icon == null) {
				return null;
			} else {
				return Icon(icon);
			}
		}

		return SizedBox(
				width: textBoxWidth,
				child: TextField(
					obscureText: obscureText,
					maxLines: maxLines,
					maxLength: maxLength,
					controller: controller,
					style: TextStyle(color: Colors.white),
					decoration: InputDecoration(
						border: OutlineInputBorder(borderRadius: BorderRadius.circular(circularRadius)),
						filled: true,
						hintStyle: TextStyle(color: Colors.grey[800]),
						hintText: this.hintText,
						prefixIcon: iconCheck(this.icon),
						prefixText: this.prefixText,
						prefixStyle: TextStyle(color: Colors.grey),
						fillColor: Colors.grey[900]
				),
			)
		);
	}
}
