import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/A.jpg',
    'assets/B.jpg',
    'assets/C.jpg',
    'assets/D.jpg',
    'assets/E.jpg',
    'assets/F.jpg',
  ];

  final List<String> teamMemberNames = [
    'Alice Wonderland',
    'Bob Marley',
    'Charlie Chaplin',
    'David Anderson',
    'Eva Malik',
    'Frank Bottom',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        endDrawer: Drawer(
          child: ListView(),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'AeneaSuspendisse Donec et convallis purus. Sed pharetra posuere velit in efficitur. Donec mauris tellus, vulputate id bibendum id, faucibus sit amet mauris. Curabitur mattis efficitur orci in varius. Ut ut arcu a lectus luctus hendrerit. Duis consequat mi eu dui suscipit eleifend. Fusce bibendum tortor diam, vitae feugiat dolor volutpat vitae.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemCount: imagePaths.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Image.asset(
                                imagePaths[index],
                                height: 70.0,
                                width: 70.0,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                teamMemberNames[index],
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey[800],
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '+94000000000',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'example@email.com',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
