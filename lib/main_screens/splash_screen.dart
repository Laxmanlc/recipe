import 'dart:async';

import 'package:recipe/const_page/const_package.dart';
import 'package:recipe/main_screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Text(
                "Richness of Nepali Spices...",
                style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 12, 9, 0)),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            Center(
                child: Container(
                    height: screenWidth * 0.75,
                    width: screenWidth * 0.74,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 20, 20, 20),
                      borderRadius: BorderRadius.circular(screenWidth * 0.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 110, 112, 81),
                          offset:
                              Offset(screenWidth * 0.015, screenWidth * 0.015),
                          blurRadius:
                              screenWidth * 0.04, // Responsive blurRadius
                          spreadRadius: screenWidth * 0.005,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(
                              -screenWidth * 0.015, -screenWidth * 0.015),
                          blurRadius:
                              screenWidth * 0.04, // Responsive blurRadius
                          spreadRadius: screenWidth * 0.005,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.5),
                      child: Image.asset(
                        "images/splashscreen.png",
                        fit: BoxFit.cover,
                      ),
                    ))),
            SizedBox(
              height: screenHeight * 0.1, // Responsive height
            ),
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 4, 177, 10),
            ),
            SizedBox(
              height: screenHeight * 0.04, // Responsive height
            ),
            const Text("Loading..."),
            SizedBox(
              height: screenHeight * 0.15, // Responsive height
            ),
            const Text(
              "Developed by @laxman",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
