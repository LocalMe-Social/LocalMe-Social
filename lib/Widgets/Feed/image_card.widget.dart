import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
	String posterUID;
	String postText;
	String postType;
	String postImageURL;
	late IconData typeIcon;

	ImageCard({
		required this.posterUID,
		required this.postText,
		required this.postType,
		required this.postImageURL
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

			default:
		}
	}

	Widget build(BuildContext context) {
		chooseType();
		return Card(
			elevation: 20,
			color: Colors.blueGrey[900],
			child: Container(
				child: Column(
					mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Container(
							padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
							child: Row(
								mainAxisSize: MainAxisSize.min,
								children: [
									Container(
									width: 50,
									height: 50,
									decoration: const BoxDecoration(
										color: Colors.grey,
										borderRadius: BorderRadius.all(Radius.circular(80))
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
										mainAxisSize: MainAxisSize.min,
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											Row(
												mainAxisSize: MainAxisSize.min,
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
						),
						Container(
							width: MediaQuery.of(context).size.width,
							child: FittedBox(
								fit: BoxFit.cover,
								child: postImageURL == '' ? const CircularProgressIndicator() : Image.network(postImageURL),
							)
						),
						Container(
							padding: const EdgeInsets.all(16),
							child: Text(postText)
						),
					],
				),
			)
		);
	}
}
