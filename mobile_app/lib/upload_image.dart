import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'description.dart';
import 'drawer.dart';

// void main() {
//   runApp(MyApp());
// }

class Upload_Image extends StatelessWidget {
  const Upload_Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File? _image;

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      // appBar: AppBar(
      //     // title: const Text('Image Picker Example'),
      //     ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Positioned(
              top: 19,
              //right: 10,
              child: IconButton(
                icon: const Icon(Icons.menu,
                    color: Color.fromARGB(255, 0, 0, 0), size: 40),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
            _image == null
                ? const Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 400,
                  ),
            const SizedBox(height: 50),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    child: const Text('Upload'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // bottom drawer with camera and gallery options
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 150,
                            color: Colors.grey[800],
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Center(
                                    child: Text(
                                      'Open Camera',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onTap: () {
                                    getImageFromCamera();
                                    Navigator.pop(context); // Close the drawer
                                  },
                                ),
                                ListTile(
                                  title: const Center(
                                    child: Text(
                                      'Open Gallery',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onTap: () {
                                    getImageFromGallery();
                                    Navigator.pop(context); // Close the drawer
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    child: const Text('Retake'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
