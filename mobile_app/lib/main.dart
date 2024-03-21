import 'package:flutter/material.dart';
//import 'package:mobile_app/photo_selection.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
        apiKey: "AIzaSyAm46eWEljscxD9krZFRPVsr-JrT0uu00g",
        appId: "1:609734600087:android:8fa6d3ea3826e3d54f50d2",
        messagingSenderId: "609734600087",
        projectId: "flutter-firebase-d55f3",
        storageBucket :"flutter-firebase-d55f3.appspot.com")
  );
  runApp(MyApp());
}