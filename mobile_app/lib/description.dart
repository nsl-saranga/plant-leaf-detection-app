import 'dart:io';

import 'package:flutter/material.dart';
import 'drawer.dart';
import 'firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Description extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String imageUrl =
      'https://cdn.britannica.com/89/126689-004-D622CD2F/Potato-leaf-blight.jpg';
  final String result; // Remove this line

  Description({Key? key, required this.result}) : super(key: key); // Modify the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Positioned(
                  top: 19,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.menu,
                        color: Color.fromARGB(255, 0, 0, 0), size: 40),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
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
                          child: Text('Document "D1" does not exist.'),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Text(
                              "Identified Disease/Pest Name: " +
                                  document['name'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Text(
                            'Cure Tips:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
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
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
