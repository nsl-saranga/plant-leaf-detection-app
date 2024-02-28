import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _showDrawer() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.21, // Set the height to 20% of the screen
          decoration: BoxDecoration(
            color: Colors.grey[800], // Set background color
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)), // Set rounded corners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    'Open Camera',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _pickImageFromCamera();
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: Center(
                  child: Text(
                    'Open Gallery',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _pickImageFromGallery();
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    // Handle the picked image file as needed
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // Handle the picked image file as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Camera and Gallery Drawer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showDrawer,
          child: Text('Show Drawer'),
        ),
      ),
    );
  }
}