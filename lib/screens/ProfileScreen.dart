import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localme_mobile/widgets/Profile/stacked_profile_stats.widget.dart';
import 'package:localme_mobile/globals.dart' as globals;
import 'package:localme_mobile/services/users.service.dart' as Users;

class ProfileScreen extends StatefulWidget {
	@override
	State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
	String userName = 'loading';
	String userAvatarUrl = '';

	void getUserInfo() async {
		var response = await Users.get(globals.currentUserId!);
		String fullname = jsonDecode(response.body)['fullname'];
		String username = jsonDecode(response.body)['username'];
		String avatarUrl = jsonDecode(response.body)['avatarUrl'].toString();
		print(username);
		setState(() {
		  userName = username;
		  userAvatarUrl = avatarUrl;
		});
	}

	@override
  	void initState() {
  	  	getUserInfo();
  	  	super.initState();
  	}

	Widget build(BuildContext context) {
		return Scaffold(
			body: SingleChildScrollView(
				child: Column(
					children: [
						Container(
							padding: EdgeInsets.only(top: 100),
							child: Container(
								width: 150,
								height: 150,
								decoration: const BoxDecoration(
									color: Colors.grey,
									borderRadius: BorderRadius.all(Radius.circular(90))
								),
								child: ClipRRect(
										borderRadius: const BorderRadius.all(Radius.circular(90)),
										child: FittedBox(
											fit: BoxFit.cover,
											child: Image.network(userAvatarUrl),
									)
								),
							),
						),
						SizedBox(height: 10),
						Text(
							'@$userName',
							style: TextStyle(
								fontSize: 20.0,
								fontWeight: FontWeight.bold
							),
						),
						Container(
							padding: EdgeInsets.only(top: 25),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									StackedProfileStats(title: "Following", stat: 10),
									StackedProfileStats(title: "Followers", stat: 10),
									StackedProfileStats(title: "Likes", stat: 10)
								],
							)
						)
					],
				),
			)
		);
	}
}