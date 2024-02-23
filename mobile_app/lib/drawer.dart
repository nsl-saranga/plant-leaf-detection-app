import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
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
                    // Navigate home.
                  },
                ),
                ListTile(
                  title: const Text(
                    'About Us',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Navigate to about us.
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
