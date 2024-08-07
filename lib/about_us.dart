import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '✿ About Us ✿',
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 63, // Adjust the radius as needed
              backgroundColor: Colors.blue, // Border color
              child: ClipOval(
                child: Image.asset(
                  'assets/images/me.jpg', // Path to your image
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Safia Nashaat Ali Mohammed",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "I am Safia Nashaat Ali Mohammad, 22 years old, living in the Arab Republic of Egypt in the city of Mansoura, a fourth-year student, Faculty of Computers and Information, Department of Computer Science, Mansoura University, I work as a mobile application developer using flutter.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Contact us :',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.call,
                  size: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "+201154289705",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  size: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "safyah14242003@gmail.com",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
