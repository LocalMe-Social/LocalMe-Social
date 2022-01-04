import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

//Logo Widget
class LogoWidget extends StatelessWidget {
  double logoWidth, logoHeight;

  LogoWidget({required this.logoWidth, required this.logoHeight});

  Widget build(BuildContext context) {
    var assetImage = const AssetImage('assets/logoblue.png');
    var image = Image(
      image: assetImage,
      width: logoWidth,
      height: logoHeight,
    );
    return Container(child: image);
  }
}

//RoundedTextField
class RoundedTextField extends StatelessWidget {
  String hintText;

  double textBoxWidth;

  double circularRadius;

  TextEditingController controller;

  IconData icon;

  bool obscureText;

  int? maxLines;

  int? maxLength;

  RoundedTextField(
      {this.hintText = "",
      required this.textBoxWidth,
      this.circularRadius = 5.0,
      required this.controller,
      required this.icon,
      this.obscureText = false,
      this.maxLines,
      this.maxLength});

  Widget build(BuildContext context) {
    return SizedBox(
        width: textBoxWidth,
        child: TextField(
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(circularRadius),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: this.hintText,
              prefixIcon: Icon(this.icon),
              fillColor: Colors.grey[900]),
        ));
  }
}

//RoundedButton
class RoundedButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  double width, height;

  RoundedButton(
      {required this.text,
      this.width = 100,
      this.height = 50,
      required this.onPressed});

  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: TextButton(
            child: Text(text),
            onPressed: onPressed,
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Colors.white))))));
  }
}

//Cards for Feed

class TextCard extends StatelessWidget {
  String posterName;
  String postText;
  String postType;

  late IconData typeIcon;

  TextCard(
      {required this.posterName,
      required this.postText,
      required this.postType});

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
        color: Colors.blueGrey[900],
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.grey[900],
              ),
              Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posterName,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(
                            typeIcon,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
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
              Divider(
                color: Colors.grey[900],
              ),
              Text(postText)
            ],
          ),
        ));
  }
}

//Image Card
class ImageCard extends StatelessWidget {
  String posterName;
  String postText;
  String postType;

  late IconData typeIcon;

  ImageCard(
      {required this.posterName,
      required this.postText,
      required this.postType});

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
        color: Colors.blueGrey[900],
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.grey[900],
              ),
              Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posterName,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(
                            typeIcon,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
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
              Divider(
                color: Colors.grey[900],
              ),
              Container(
                child: Image.network(
                    "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/320036721/1800"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(postText)
            ],
          ),
        ));
  }
}

//Stacked Profile Stats
class StackedProfileStats extends StatelessWidget {
  String title;
  int stat;

  StackedProfileStats({required this.title, required this.stat});

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(
          stat.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

//Messages Card
class MessageCard extends StatelessWidget {
  String name;
  String recentMessage;

  MessageCard({required this.name, required this.recentMessage});

  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      child: Row(children: [
        SizedBox(
          width: 10.0,
          height: 70.0,
        ),
        CircleAvatar(
          radius: 25.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(recentMessage)
          ],
        )
      ]),
    );
  }
}

class CategorySelectionBox extends StatelessWidget {
  String text;
  IconData icon;
  void Function(bool?)? onChanged;
  bool? value;

  CategorySelectionBox(
      {required this.text,
      required this.icon,
      required this.onChanged,
      required this.value});

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Icon(
          icon,
          color: Colors.blueGrey,
        ),
        Transform.scale(
          scale: 2.0,
          child: Checkbox(
            activeColor: Colors.blueGrey,
            shape: CircleBorder(),
            tristate: false,
            splashRadius: 30,
            onChanged: onChanged,
            value: value,
          ),
        )
      ],
    );
  }
}
