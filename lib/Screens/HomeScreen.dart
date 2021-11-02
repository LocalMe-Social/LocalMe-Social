// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/Screens/FeedScreen.dart';
import 'package:localmeapp/Screens/MessagesScreen.dart';
import 'package:localmeapp/Screens/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.blueGrey[900],
        child: TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
                icon: const Icon(
              Icons.local_library,
              color: Colors.white,
            )),
            new Tab(
                icon: const Icon(
              Icons.message,
              color: Colors.white,
            )),
            //new Tab(icon: Icon(Icons.location_city)),
            //new Tab(icon: Icon(Icons.people)),
            new Tab(
                icon: const Icon(
              Icons.person,
              color: Colors.white,
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[FeedScreen(), MessagesScreen(), ProfileScreen()],
      ),
    );
  }
}
