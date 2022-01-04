// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:localmeapp/globals.dart' as globals;

class CreatePostScreen extends StatefulWidget {
  CreatePostScreenState createState() => CreatePostScreenState();
}

class PostOptionsScreen extends StatefulWidget {
  PostOptionsScreenState createState() => PostOptionsScreenState();
}

class PostOptionsMapScreen extends StatefulWidget {
  @override
  PostOptionsMapScreenState createState() => PostOptionsMapScreenState();
}

//Variables for Post Creation
TextEditingController _descriptionController = TextEditingController();
final ImagePicker _picker = ImagePicker();
XFile? image;

//Screen for Creating a Post (Image or Text)
class CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Post",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {},
      ),
      body: Row(children: [
        Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    color: Colors.blueGrey[900],
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "What's on your mind?",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          //Text Field for Post Description
                          RoundedTextField(
                              textBoxWidth: 400,
                              maxLines: 8,
                              controller: _descriptionController,
                              icon: Icons.description),
                          const SizedBox(height: 20.0),
                          const Text(
                            "Have something to show?",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20.0),

                          //Pick and Image Button
                          Center(
                            child: RoundedButton(
                              text: "Pick an Image!",
                              onPressed: () async {
                                image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                              },
                              width: 600,
                              height: 200,
                            ),
                          )
                        ],
                      ),
                    )))
          ],
        )
      ]),
    );
  }
}

class PostOptionsScreenState extends State<PostOptionsScreen> {
  //Variables for Checkbox States
  bool? peopleCheckBox = true;
  bool? newsCheckBox = false;
  bool? eventsCheckBox = false;
  bool? businessCheckBox = false;
  bool? currentLocationCheckBox = true;
  bool? otherLocationCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Post",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {},
      ),
      body: Row(children: [
        Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    color: Colors.blueGrey[900],
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Choose a category",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //Selection Boxes for Categorys
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //People
                              CategorySelectionBox(
                                  text: "People",
                                  icon: Icons.people,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (peopleCheckBox == false) {
                                        peopleCheckBox = value;
                                        newsCheckBox = false;
                                        eventsCheckBox = false;
                                        businessCheckBox = false;
                                      }
                                    });
                                  },
                                  value: peopleCheckBox),
                              const SizedBox(
                                width: 25.0,
                              ),

                              //News
                              CategorySelectionBox(
                                  text: "News",
                                  icon: Icons.rss_feed,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (newsCheckBox == false) {
                                        newsCheckBox = value;
                                        peopleCheckBox = false;
                                        eventsCheckBox = false;
                                        businessCheckBox = false;
                                      }
                                    });
                                  },
                                  value: newsCheckBox),
                              const SizedBox(
                                width: 25.0,
                              ),

                              //Events
                              CategorySelectionBox(
                                  text: "Events",
                                  icon: Icons.celebration,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (eventsCheckBox == false) {
                                        eventsCheckBox = value;
                                        peopleCheckBox = false;
                                        newsCheckBox = false;
                                        businessCheckBox = false;
                                      }
                                    });
                                  },
                                  value: eventsCheckBox),
                              const SizedBox(
                                width: 15.0,
                              ),

                              //Businesses
                              CategorySelectionBox(
                                  text: "Business",
                                  icon: Icons.store,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (businessCheckBox == false) {
                                        businessCheckBox = value;
                                        eventsCheckBox = false;
                                        newsCheckBox = false;
                                        peopleCheckBox = false;
                                      }
                                    });
                                  },
                                  value: businessCheckBox),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Where is this post?",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CategorySelectionBox(
                                  text: "Current Location",
                                  icon: Icons.pin_drop,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (currentLocationCheckBox == false) {
                                        currentLocationCheckBox = value;
                                        otherLocationCheckBox = false;
                                      }
                                    });
                                  },
                                  value: currentLocationCheckBox),
                              SizedBox(
                                width: 10,
                              ),
                              CategorySelectionBox(
                                  text: "Other Location",
                                  icon: Icons.map,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (otherLocationCheckBox == false) {
                                        otherLocationCheckBox = value;
                                        currentLocationCheckBox = false;
                                      }
                                    });
                                  },
                                  value: otherLocationCheckBox),
                            ],
                          )
                        ],
                      ),
                    )))
          ],
        )
      ]),
    );
  }
}

class PostOptionsMapScreenState extends State<PostOptionsMapScreen> {
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(globals.position!.latitude, globals.position!.longitude),
        rotationThreshold: 100,
        maxZoom: 18,
        minZoom: 11,
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: [],
        ),
      ],
    );
  }
}
