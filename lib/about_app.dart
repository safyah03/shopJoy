import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth;
    screenWidth = MediaQuery.of(context).size.width;
    double screenHeight;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'About App',
            )),
        body: Center(
            child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/question-mark.png'),
                  fit: BoxFit.fill,
                  opacity: 0.11)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50, // Adjust the radius as needed
                  backgroundColor: Colors.white, // Border color
                  child: Image.asset(
                    'assets/images/logo.png', // Path to your image
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "ShopJoy App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blue),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    "This application is an e-shopping application that displays many products from all types of products that anyone needs, and the data inside it is taken from the website (http//dummyjson.com), and this application is basically a project for a summer training grant at the ITI Academy in the field of developing mobile applications using flutter, and it was developed by me, the student Safia Nashaat Ali Mohammad.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
