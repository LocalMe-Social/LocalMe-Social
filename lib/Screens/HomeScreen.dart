import 'package:flutter/material.dart';
import 'package:localme_mobile/screens/FeedScreen.dart';

class HomeScreen extends StatefulWidget {
	const HomeScreen({super.key});
	@override
	_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
		with SingleTickerProviderStateMixin {
	late TabController tabController;

	@override
	void initState() {
		super.initState();
		tabController = TabController(length: 3, vsync: this);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: Material(
				color: Colors.black,
				child: TabBar(
					controller: tabController,
					tabs: const <Widget>[
						Tab(
							icon: Icon(
								Icons.home,
								color: Colors.white,
						)),
						Tab(
							icon: Icon(
								Icons.message,
								color: Colors.white,
						)),
						//new Tab(icon: Icon(Icons.location_city)),
						//new Tab(icon: Icon(Icons.people)),
						Tab(
							icon: Icon(
								Icons.person,
								color: Colors.white,
						)),
					],
				),
			),
			body: TabBarView(
				controller: tabController,
				children: <Widget>[FeedScreen()],
			),
		);
	}
}