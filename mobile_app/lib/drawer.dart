import 'package:flutter/material.dart';
import 'about.dart';
import 'home.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 187,
      child: Container(
        color: const Color.fromARGB(255, 41, 41, 41),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'About Us',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Version 1.0.1',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
