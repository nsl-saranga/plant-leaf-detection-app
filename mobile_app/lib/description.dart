import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final String imageUrl =
      'https://cdn.britannica.com/89/126689-004-D622CD2F/Potato-leaf-blight.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Disease/ Pest Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Disease/ Pest Name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0 ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec consequat velit. Nulla vitae magna eu turpis aliquam feugiat. ...',
            ),
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            Text(
              'How to Cure',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Column(
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
            SizedBox(height: 16.0),
            Text(
              'Other Possible Results',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Handle link click action here
                print("Link Clicked!");
              },
              child: Text(
                'Possible result 2',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            GestureDetector(
              onTap: () {
                // Handle link click action here
                print("Link Clicked!");
              },
              child: Text(
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
