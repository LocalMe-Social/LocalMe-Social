import 'package:flutter/material.dart';
import 'firebaseimports.dart';

class GetTextFrom extends StatelessWidget {
  String documentId;
  TextStyle textStyle;
  CollectionReference collection;
  String field;

  GetTextFrom(this.collection, this.documentId, this.field, this.textStyle);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: collection.doc(documentId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data[field]}", style: textStyle,);
        }
        return Text("loading");
      },
    );
  }
}

class GetImageFrom extends StatelessWidget {
  String documentId;
  CollectionReference collection;
  String field;

  GetImageFrom(this.collection, this.documentId, this.field);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: collection.doc(documentId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Image.network("${data[field]}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}