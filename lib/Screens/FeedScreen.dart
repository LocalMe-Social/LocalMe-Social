// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:localmeapp/firebaseimports.dart';
import 'package:localmeapp/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localmeapp/globals.dart' as globals;

class FeedScreen extends StatefulWidget {
	@override
	FeedScreenState createState() => FeedScreenState();
}

Future<QuerySnapshot<Map<String, dynamic>>> getFeed() async {
  	var firestore = FirebaseFirestore.instance;
  	var querySnap = await firestore
	  	.collection('posts')
	  	.get();
  return querySnap;
}

class FeedScreenState extends State<FeedScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.blueGrey[900],
				title: const Text(
					"LocalMe",
					style: TextStyle(
							fontFamily: 'Lobster', color: Colors.white, fontSize: 25),
				),
			),
			floatingActionButton: FloatingActionButton(
				backgroundColor: Colors.white,
				child: Icon(Icons.add),
				onPressed: () {
					Navigator.of(context).pushNamed('/CreatePostScreen');
				},
			),
			body: Container(
				child: FutureBuilder(
					future: getFeed(),
					builder: (context, AsyncSnapshot<QuerySnapshot> postSnapshot) {
						if (postSnapshot.hasError) {
							return const Text("An Error Occured");
						}
						if (!postSnapshot.hasData) {
							return const CircularProgressIndicator();
						} else if (postSnapshot.hasData) {
							int postCount = postSnapshot.data!.docs.length;
							return ListView.builder(
								shrinkWrap: true,
								itemCount: postCount,
								itemBuilder: (BuildContext context, int index) {
									if(Geolocator.distanceBetween(globals.position!.latitude, globals.position!.longitude, postSnapshot.data!.docs[index]["latitude"], postSnapshot.data!.docs[index]["longitude"]) <= (globals.postRadius! * 100)) {
										switch(postSnapshot.data!.docs[index]["Type"]) {
											case "Image":
												return ImageCard(
													posterUID: postSnapshot.data!.docs[index]["PosterUID"], 
													postText: postSnapshot.data!.docs[index]["PostText"], 
													postType: postSnapshot.data!.docs[index]["PostType"], 
													postImageURL: postSnapshot.data!.docs[index]["PostImageURL"],
											);
											case "Text":
												return TextCard(
													posterUID: postSnapshot.data!.docs[index]["PosterUID"], 
													postText: postSnapshot.data!.docs[index]["PostText"], 
													postType: postSnapshot.data!.docs[index]["PostType"],
											);
										}
									}
									return Text("Error");
								}
							);
						}
						return Text("Error");
					}
				),
			)
		);
	}
}
