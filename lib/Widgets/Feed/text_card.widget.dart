import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localme_mobile/services/users.service.dart' as Users;

class TextCard extends StatefulWidget {
	TextCard({
		required this.posterUID,
		required this.postText,
		required this.postType
	});

	String posterUID;
	String postText;
	String postType;

	State<TextCard> createState() => _TextCardState();
}

class _TextCardState extends State<TextCard> {
	String posterName = 'loading';
	String posterAvatarUrl = '';
	late IconData typeIcon;

	chooseType() {
		switch (widget.postType) {
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

	void getPosterInfo(String userID) async {
		var response = await Users.get(widget.posterUID);
		String fullname = jsonDecode(response.body)['fullname'];
		String avatarUrl = jsonDecode(response.body)['avatarUrl'];
		setState(() {
		  posterName = fullname;
		  posterAvatarUrl = avatarUrl;
		});
		print(fullname);
		print(avatarUrl);
	}

	@override
  void initState() {
    getPosterInfo(widget.posterUID);
    super.initState();
  }

	Widget build(BuildContext context) {
		chooseType();
		return Card(
			color: Colors.grey[900],
			child: Container(
				padding: const EdgeInsets.all(16),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
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
												child: Image.network(posterAvatarUrl),
										)
									),
								),
								const SizedBox(width: 10.0),
								Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Text(posterName),
										Row(
											children: [
												Icon(
													typeIcon,
													color: Colors.white,
												),
												const SizedBox(width: 5),
												Text(
													widget.postType,
													style: TextStyle(fontSize: 12),
												)
											],
										)
									],
								)
							],
						),
						Divider(color: Colors.grey[900]),
						Text(widget.postText)
					],
				),
			)
		);
	}
}
