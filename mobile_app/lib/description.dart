import 'dart:io';

import 'package:flutter/material.dart';
import 'drawer.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Home(),
//   ));
// }

class Description extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String imageUrl =
      'https://cdn.britannica.com/89/126689-004-D622CD2F/Potato-leaf-blight.jpg';

  Description({super.key, File? image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      // appBar: AppBar(

      //     // title: Text('Disease/ Pest Details'),
      //     ),
      body: SingleChildScrollView(
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
            const Text(
              'Disease/ Pest Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec consequat velit. Nulla vitae magna eu turpis aliquam feugiat. ...',
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'How to Cure',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_right),
                  title: Text('Item 1'),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_right),
                  title: Text('Item 2'),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_right),
                  title: Text('Item 3'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Other Possible Results',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Handle link click action here
                print("Link Clicked!");
              },
              child: const Text(
                'Possible result 2',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            GestureDetector(
              onTap: () {
                // Handle link click action here
                print("Link Clicked!");
              },
              child: const Text(
                'Possible result 3',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
