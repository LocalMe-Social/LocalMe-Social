// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localme_mobile/widgets/Feed/image_card.widget.dart';
import 'package:localme_mobile/widgets/Feed/text_card.widget.dart';
import 'package:localme_mobile/services/posts.service.dart' as Posts;
import 'package:localme_mobile/globals.dart' as globals;

class FeedScreen extends StatefulWidget {
	@override
	State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
	var postItems;
	Future getFeed() async {
		var response = await Posts.get();
		if(response.statusCode == 200) {
			setState(() {
				postItems = jsonDecode(response.body)['data'];
			});
		}
	}

	@override
	void initState() {
		getFeed();
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.black,
				title: const Text(
					"LocalMe",
					style: TextStyle(
						fontFamily: 'Lobster', color: Colors.white, fontSize: 25,
					),
				),
			),
			floatingActionButton: FloatingActionButton(
				backgroundColor: Colors.white,
				child: const Icon(Icons.add),
				onPressed: () async {
				},
			),
			body: RefreshIndicator(
				onRefresh: getFeed,
				child: Expanded(
					child: ListView.builder(
						itemCount: postItems.length,
						itemBuilder: (BuildContext context, index) {
							final item = postItems[index];
							if(item['type'] == 'TEXT') {
								return TextCard(posterUID: item['creatorId'], postText: item['description'], postType: item['category']);
							}
							return ImageCard(posterUID: item['creatorId'], postText: item['description'], postType: item['category'], postImageURL: item['photoUrl']);
						}
					),
				)
			)
		);
	}
}
