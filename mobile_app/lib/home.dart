import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'drawer.dart';
import 'upload_image.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  _HomePageState();

  Future<void> getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
      if (_image != null) {
        navigateToUploadImage(); // Navigate on image selection
      }
    });
  }

  Future<void> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
      if (_image != null) {
        navigateToUploadImage(); // Navigate on image selection
      }
    });
  }

  void navigateToUploadImage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Upload_Image(), // No argument passed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        body: Stack(
          children: [
            // Background image
            Image.asset(
              "assets/s-l1600.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Faded overlay
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromARGB(255, 175, 175, 175).withOpacity(0.7),
            ),
            // Hamburger menu
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
            // Message to user 1
            Positioned(
              top: 200,
              left: 35,
              child: Container(
                width: 324,
                height: 68,
                color: const Color.fromARGB(0, 255, 255, 255),
                child: const Center(
                  child: Text(
                    'Upload an image of the diseased leaf or pest',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
            // Message to user 2
            Positioned(
              top: 300,
              left: 55,
              child: Container(
                width: 279,
                height: 35,
                color: const Color.fromARGB(0, 255, 255, 255),
                child: const Center(
                  child: Text(
                    'Take a picture of the affected maize plant leaf and upload it. (follow the below instructions.)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
            // camera icon
            Positioned(
              top: 400,
              left: 30,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        "assets/c1de70de69617aa348d75f26198647e8.png"),
                  ),
                  color:
                      const Color.fromARGB(31, 107, 107, 107).withOpacity(0.5),
                  backgroundBlendMode:
                      BlendMode.lighten, // Blend image with the background
                ),
              ),
            ),
            // arrow 1
            Positioned(
              top: 440,
              left: 130,
              child: SizedBox(
                width: 13,
                height: 22,
                child: SvgPicture.asset(
                  "assets/chevron-right-solid 1.svg",
                  placeholderBuilder: (BuildContext context) => Container(
                    width: 13,
                    height: 22,
                    color: const Color.fromARGB(31, 107, 107, 107)
                        .withOpacity(0.5),
                  ),
                ),
              ),
            ),
            // Corn icon
            Positioned(
              top: 400,
              left: 150,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        "assets/707f5c11260dbc6ed69b70a47b9d9b53.png"),
                  ),
                  color:
                      const Color.fromARGB(31, 107, 107, 107).withOpacity(0.5),
                  backgroundBlendMode: BlendMode.lighten,
                ),
              ),
            ),
            // arrow 2
            Positioned(
              top: 440,
              left: 250,
              child: SizedBox(
                width: 13,
                height: 22,
                child: SvgPicture.asset(
                  "assets/chevron-right-solid 1.svg",
                  placeholderBuilder: (BuildContext context) => Container(
                    width: 13,
                    height: 22,
                    color: const Color.fromARGB(31, 107, 107, 107)
                        .withOpacity(0.5),
                  ),
                ),
              ),
            ),
            // document icon
            Positioned(
              top: 400,
              left: 280,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        "assets/a332688246827b53f99869208c9b5ad6.png"),
                  ),
                  color:
                      const Color.fromARGB(31, 107, 107, 107).withOpacity(0.5),
                  backgroundBlendMode: BlendMode.lighten,
                ),
              ),
            ),
            // Start button
            Positioned(
              bottom: 150,
              left: 140,
              child: SizedBox(
                width: 118,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 41, 41, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
