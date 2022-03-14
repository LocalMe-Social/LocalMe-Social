// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:localmeapp/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localmeapp/globals.dart' as globals;
import 'package:localmeapp/firebaseimports.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Text Field Controllers
TextEditingController _emailController = TextEditingController();
TextEditingController _usernameController = TextEditingController();
TextEditingController _fullnameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();

//SignUp Variables
late String _username;
late String _fullname;
late String _email;
late String _password;
late String _confirmPassword;

File? _image;

class SignUpScreen extends StatefulWidget {
	const SignUpScreen({Key? key}) : super(key: key);
	@override
	SignUpScreenState createState() => SignUpScreenState();
}

class SignUpInfoScreen extends StatefulWidget {
	const SignUpInfoScreen({Key? key}) : super(key: key);
	@override
	SignUpInfoScreenState createState() => SignUpInfoScreenState();
}

class SignUpPasswordScreen extends StatefulWidget {
	const SignUpPasswordScreen({Key? key}) : super(key: key);
	@override
	SignUpPasswordScreenState createState() => SignUpPasswordScreenState();
}

class SignUpAvatarScreen extends StatefulWidget {
	const SignUpAvatarScreen({Key? key}) : super(key: key);
	@override
	SignUpAvatarScreenState createState() => SignUpAvatarScreenState();
}

class SignUpLoadingScreen extends StatefulWidget {
	const SignUpLoadingScreen({Key? key}) : super(key: key);
	@override
	SignUpLoadingScreenState createState() => SignUpLoadingScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
            children: [
              const SizedBox(height: 100.0),
              LogoWidget(logoWidth: 200, logoHeight: 200),
              const SizedBox(height: 30.0),
              Row(
                children: const [
                  Text(
                    "Welcome to ",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "LocalMe",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Lobster'
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Enter Your Email Address",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0),
              RoundedTextField(
                textBoxWidth: MediaQuery.of(context).size.width-80, 
                controller: _emailController,
                maxLines: 1,
                icon: Icons.email,
              ),
              const SizedBox(height: 30.0),
              InkWell(
                child: CircleAvatar(
                  minRadius: 30.0,
                  child: Icon(Icons.arrow_forward),
                ),
                onTap: () {
                  if(_emailController.text != '') {
                    _email = _emailController.text;
                    Navigator.of(context).pushNamed('/SignUpInfoScreen');
                  }
                },
              )
            ],
          )
				],
			)
		);
	}
}

class SignUpInfoScreenState extends State<SignUpInfoScreen> {
  @override
  Widget build(BuildContext context) {
		return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
            children: [
              const SizedBox(height: 100.0),
              LogoWidget(logoWidth: 100, logoHeight: 100),
              const SizedBox(height: 30.0),
              const Text(
                "Just a little bit more info",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0),
              RoundedTextField(
                textBoxWidth: MediaQuery.of(context).size.width-80, 
                controller: _usernameController,
                maxLines: 1,
                prefixText: "@",
                hintText: "Username",
              ),
              const SizedBox(height: 20.0),
              RoundedTextField(
                textBoxWidth: MediaQuery.of(context).size.width-80, 
                controller: _fullnameController,
                maxLines: 1,
                icon: Icons.person,
                hintText: "Full Name",
              ),
              const SizedBox(height: 30.0),
              InkWell(
                child: CircleAvatar(
                  minRadius: 30.0,
                  child: Icon(Icons.arrow_forward),
                ),
                onTap: () {
                  if(_usernameController.text != '' && _fullnameController.text != '') {
                    _username = _usernameController.text;
                    _fullname = _fullnameController.text;
                    Navigator.of(context).pushNamed('/SignUpPasswordScreen');
                  }
                },
              )
            ],
          )
				],
			)
		);
	}
}

class SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  @override
  Widget build(BuildContext context) {
		return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
            children: [
              const SizedBox(height: 100.0),
              LogoWidget(logoWidth: 100, logoHeight: 100),
              const SizedBox(height: 30.0),
              const Text(
                "Choose a secure password",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10.0),
               const Text(
                "🔒",
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              const SizedBox(height: 20.0),
              RoundedTextField(
                textBoxWidth: MediaQuery.of(context).size.width-80, 
                controller: _passwordController,
                maxLines: 1,
                icon: Icons.lock,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              RoundedTextField(
                textBoxWidth: MediaQuery.of(context).size.width-80, 
                controller: _confirmPasswordController,
                maxLines: 1,
                icon: Icons.lock,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 30.0),
              InkWell(
                child: CircleAvatar(
                  minRadius: 30.0,
                  child: Icon(Icons.arrow_forward),
                ),
                onTap: () {
                  if(
                    _passwordController.text == _confirmPasswordController.text && 
                    _passwordController.text != '' &&
                    _confirmPasswordController.text != '' &&
                    _passwordController.text.length > 8 &&
                    _passwordController.text.contains(RegExp(r'[A-Z]'))
                    ) {
                    _password = _passwordController.text;
                    Navigator.of(context).pushNamed('/SignUpAvatarScreen');
                  }
                },
              )
            ],
          )
				],
			)
		);
	}
}

class SignUpAvatarScreenState extends State<SignUpAvatarScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  bool? staySignedIn = false;

  final picker = ImagePicker();
  String? postUrl;

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

  uploadImage(File image, String name) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(name);
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      postUrl = await ref.getDownloadURL();
      print(postUrl);
      users.doc(globals.userID).set({'ProfilePictureURL': postUrl}, SetOptions(merge: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			body: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Column(
            children: [
              const SizedBox(height: 100.0),
              LogoWidget(logoWidth: 100, logoHeight: 100),
              const SizedBox(height: 30.0),
              const Text(
                "Choose a Profile Picture",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20.0),
              InkWell(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(80))
                  ),
                  child: _image == null
                    ? Icon(Icons.add)
                    : ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.file(_image!),
                      )
                    ),
                ),
                onTap: getImage
              ),
              const SizedBox(height: 30.0),
              Row(
					      mainAxisAlignment: MainAxisAlignment.center,
					      children: [
					      	Checkbox(
					      		value: staySignedIn,
					      		onChanged: (bool? value) {
					      			setState(() {
					      				staySignedIn = value!;
					      			});
					      		},
					      	),
					      	const Text("Stay Signed In?")
					      ],
				      ),
              const SizedBox(height: 30.0),
              InkWell(
                child: CircleAvatar(
                  minRadius: 30.0,
                  child: Icon(Icons.arrow_forward),
                ),
                onTap: () async {
			            try {
			          	  UserCredential userCredential = await FirebaseAuth.instance
			          	  	.createUserWithEmailAndPassword(
			          	  		email: _emailController.text,
			          	  		password: _passwordController.text);
                    globals.userID = userCredential.user!.uid;
                    await uploadImage(_image!, userCredential.user!.uid.toString()+"_profile_image");
			          	  users.doc(userCredential.user!.uid).set({
			          	    'UID': userCredential.user!.uid,
			          	    'Email': userCredential.user!.email,
                      'FullName': _fullname,
                      'Username': _username,
			          	});
			          	if(staySignedIn == true) {
			          	  SharedPreferences prefs = await SharedPreferences.getInstance();
			          	  prefs.setString('uid', userCredential.user!.uid);
			          	}
			          	Navigator.of(context).pushNamedAndRemoveUntil('/HomeScreen', (route) => false);
                  users.doc(userCredential.user!.uid).set({'ProfilePictureURL': postUrl}, SetOptions(merge: true));
			            } on FirebaseAuthException catch (e) {
			          	if (e.code == 'weak-password') {
			          	  print('The password provided is too weak.');
			          	} else if (e.code == 'email-already-in-use') {
			          	  print('The account already exists for that email.');
			          	}
			            } catch (e) {
			          	print(e);
			            }
			          }
              )
            ]
          )
        ]
      )
    );
  }
}

class SignUpLoadingScreenState extends State<SignUpLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
