import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'description.dart';
import 'drawer.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

class Upload_Image extends StatelessWidget {
  final File? image;
  const Upload_Image({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(image: image),
    );
  }
}

class HomePage extends StatefulWidget {
  final File? image;
  const HomePage({Key? key, this.image}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String prediction = '';
  File? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
  }



  Future<String> uploadImage() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse('https://188f-112-134-101-62.ngrok-free.app/upload'));
    final headers = {"Content-type": "Multipart/form-data"};

    request.files.add(http.MultipartFile(
        'image',
        _image!.readAsBytes().asStream(),
        _image!.lengthSync(),
        filename: _image!.path.split("/").last));
    request.headers.addAll(headers);

    try {
      final response = await request.send();
      final res = await http.Response.fromStream(response);
      final resJson = jsonDecode(res.body);
      setState(() {
        prediction = resJson['prediction'];
      });
    } catch (e) {
      print("Error uploading image: $e");
    }
    return prediction;
  }

  Future<void> _uploadAndNavigate() async {
    String result = await uploadImage();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Description(result:result)),
    );
  }

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
                    onPressed: () async {
                      print("click");
                      _uploadAndNavigate();
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
