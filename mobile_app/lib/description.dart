import 'dart:io';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Description extends StatefulWidget {
  final String result;

  Description({Key? key, required this.result}) : super(key: key);
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String imageUrl =
      'https://cdn.britannica.com/89/126689-004-D622CD2F/Potato-leaf-blight.jpg';

  String _getDocumentId(String result) {
    if (result == "Fall_Armyworm") {
      return "D1";
    } else if (result == "Common_Rust") {
      return "D2";
    } else if (result == "Blight") {
      return "D3";
    } else if (result == "Gray_Leaf_Spot") {
      return "D4";
    } else if (result == "Healthy") {
      return "D5";
    } else if (result == "Weevil ") {
      return "D6";
    } else {
      // Default case, return a fallback document ID
      return "default";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu,
                    color: Color.fromARGB(255, 0, 0, 0), size: 40),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Disease')
                    .doc("D1")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var document = snapshot.data!;
                    if (!document.exists) {
                      return Center(
                        child: Text('Document "${_getDocumentId(widget.result)}" does not exist.'),
                      );
                    }
                    dynamic imageData = document['images'];
                    String imageRef;
                    if (imageData is String) {
                      imageRef = imageData;
                    } else if (imageData is DocumentReference) {
                      imageRef = imageData.path;
                    } else {
                      return Text('Invalid image reference');
                    }
                    DocumentReference imageDocRef =
                    FirebaseFirestore.instance.doc(imageRef);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Disease/Pest Name: " + document['name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  color: Colors.indigo,
                                ),
                              ),// Add some space between the name and
                            ],
                          ),
                        ),

                        Text(
                          document['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),//
                        SizedBox(height: 20),// Adjust the height as needed
                        Text(
                          'Cure Tips:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(), // Disable scrolling for this ListView
                          shrinkWrap: true,
                          itemCount: document['Cure Tips'].length,
                          itemBuilder: (context, index) {
                            final tip = document['Cure Tips'][index];
                            return ListTile(
                              leading: Icon(Icons.check),
                              title: Text(tip),
                            );
                          },
                        ),
                        SizedBox(height: 10), // Adjust the height as needed
                        Image.network("https://www.sanbi.org/wp-content/uploads/2018/10/armyworm-1.jpg"),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
