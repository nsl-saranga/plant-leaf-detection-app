import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  print('Hamburger menu pressed');
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
                color: Color.fromARGB(0, 255, 255, 255),
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
                color: Color.fromARGB(0, 255, 255, 255),
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
              child: Container(
                width: 13,
                height: 22,
                child: SvgPicture.asset(
                  "assets/chevron-right-solid 1.svg",
                  placeholderBuilder: (BuildContext context) => Container(
                    width: 13,
                    height: 22,
                    color: Color.fromARGB(31, 107, 107, 107).withOpacity(0.5),
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
                  backgroundBlendMode:
                      BlendMode.lighten, // Blend image with the background
                ),
              ),
            ),
            // arrow 2
            Positioned(
              top: 440,
              left: 250,
              child: Container(
                width: 13,
                height: 22,
                child: SvgPicture.asset(
                  "assets/chevron-right-solid 1.svg",
                  placeholderBuilder: (BuildContext context) => Container(
                    width: 13,
                    height: 22,
                    color: Color.fromARGB(31, 107, 107, 107).withOpacity(0.5),
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
                  backgroundBlendMode:
                      BlendMode.lighten, // Blend image with the background
                ),
              ),
            ),
            // Start button
            Positioned(
              bottom: 150, // Adjust bottom position as needed
              left: 140, // Adjust left position as needed
              child: SizedBox(
                width: 118,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                    print('Start button pressed');
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
