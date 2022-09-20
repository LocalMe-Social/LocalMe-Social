import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
	String posterUID;
	String postText;
	String postType;
	late IconData typeIcon;

	TextCard({
		required this.posterUID,
		required this.postText,
		required this.postType
	});

	chooseType() {
		switch (postType) {
			case "People":
				typeIcon = Icons.people;
				break;

			case "Business":
				typeIcon = Icons.store;
				break;

			case "News":
				typeIcon = Icons.menu_book;
				break;
		}
	}

	Widget build(BuildContext context) {
		chooseType();
		return Card(
			color: Colors.blueGrey[900],
			child: Container(
				padding: const EdgeInsets.all(16),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Divider(color: Colors.grey[900]),
						Row(
							children: [
								Container(
									width: 50,
									height: 50,
									decoration: const BoxDecoration(
										color: Colors.grey,
										borderRadius: BorderRadius.all(Radius.circular(90))
									),
									child: ClipRRect(
											borderRadius: const BorderRadius.all(Radius.circular(90)),
											child: FittedBox(
												fit: BoxFit.cover,
										)
									),
								),
								const SizedBox(width: 10.0),
								Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Row(
											children: [
												Icon(
													typeIcon,
													color: Colors.white,
												),
												const SizedBox(width: 5),
												Text(
													postType,
													style: TextStyle(fontSize: 12),
												)
											],
										)
									],
								)
							],
						),
						Divider(color: Colors.grey[900]),
						Text(postText)
					],
				),
			)
		);
	}
}
