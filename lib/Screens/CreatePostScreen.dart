// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localmeapp/firebaseimports.dart';
import 'package:localmeapp/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:localmeapp/globals.dart' as globals;

class CreatePostScreen extends StatefulWidget {
  @override
  CreatePostScreenState createState() => CreatePostScreenState();
}

class PostOptionsScreen extends StatefulWidget {
  @override
  PostOptionsScreenState createState() => PostOptionsScreenState();
}

class PostOptionsMapScreen extends StatefulWidget {
  @override
  PostOptionsMapScreenState createState() => PostOptionsMapScreenState();
}

//Variables for Post Creation
TextEditingController _descriptionController = TextEditingController();
final ImagePicker picker = ImagePicker();
File? _image;
String? postType;

//Screen for Creating a Post (Image or Text)
class CreatePostScreenState extends State<CreatePostScreen> {
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Post",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            if (_descriptionController.text != "" && _image != null) {
              postType = "Image";
              Navigator.of(context).pushNamed('/PostOptionsScreen');
            } else if (_image != null) {
              postType = "Image";
              Navigator.of(context).pushNamed('/PostOptionsScreen');
            } else if (_descriptionController.text != "" || _image == null) {
              postType = "Text";
              Navigator.of(context).pushNamed('/PostOptionsScreen');
            } else {
              print("No Post Data");
            }
          },
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
                              child: InkWell(
                                child: Container(
                                  width: 512,
                                  height: 288,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: _image == null
                                    ? Icon(Icons.add)
                                    : ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.file(_image!),
                                      )
                                    ),
                                ),
                                onTap: getImage
                              ),
                            )
                          ],
                        ),
                      )))
            ],
          )
        ]),
      )
    );
  }
}

class PostOptionsScreenState extends State<PostOptionsScreen> {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  //Variables for Checkbox States
  bool? peopleCheckBox = true;
  bool? newsCheckBox = false;
  bool? eventsCheckBox = false;
  bool? businessCheckBox = false;
  bool? currentLocationCheckBox = true;
  bool? otherLocationCheckBox = false;

  String? postCategory = 'People';
  String? postUrl;

  createImagePost(File image, String name) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(name);
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      postUrl = await ref.getDownloadURL();
      print(postUrl);
      posts.doc(name).set({
      'PostText': _descriptionController.text,
      'PostType': postCategory,
      'PosterUID': globals.userID,
      'PostImageURL': postUrl,
      'Type': postType,
      'latitude': globals.position!.latitude,
      'longitude': globals.position!.longitude,
      });
    });
  }

  createTextPost(String name) async {
    posts.add({
      'PostText': _descriptionController.text,
      'PostType': postCategory,
      'PosterUID': globals.userID,
      'Type': postType,
      'latitude': globals.position!.latitude,
      'longitude': globals.position!.longitude,
    });
  }


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
        onPressed: () async {
          print("pressed");
          String id = posts.doc().id;
          print("pressed1");
          if(postType == "Image") {
            createImagePost(_image!, id);
          } else {
            createTextPost(id);
          }
          Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
        },
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

                                        postCategory = "People";
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

                                        postCategory = "News";
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

                                        postCategory = "Events";
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

                                        postCategory = "Business";
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
        onTap: (tapPosition, point) {},
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
