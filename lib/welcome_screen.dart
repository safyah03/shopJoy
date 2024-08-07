import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shop_joy/auth_screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Discounted Prices!',
        body: "We have high quality products and affordable prices",
        image: Center(
          child: Image.asset(
            'assets/images/discounts.jpg',
            width: 220,
            height: 220,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: 'Multiple Options!',
        body: "We have multiple options of all products to suit all tastes",
        image: Center(
          child: Image.asset(
            'assets/images/options.jpg',
            width: 220,
            height: 220,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: 'Amazing Variety!',
        body: "We have a variety of products to suit all family members",
        image: Center(
          child: Image.asset(
            'assets/images/variety.jpg',
            width: 220,
            height: 220,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
  ];

  void onDone(context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("❀ Welcome to your app ❀"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: IntroductionScreen(
            pages: pages,
            dotsDecorator: const DotsDecorator(
              size: Size(15, 15),
              color: Colors.blue,
              activeSize: Size.square(20),
              activeColor: Color(0xFF90CAF9),
            ),
            showDoneButton: true,
            done: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(17)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Let's Go",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            showSkipButton: true,
            skip: const Text(
              'Skip',
              style: TextStyle(fontSize: 20),
            ),
            showNextButton: true,
            next: const Icon(
              Icons.arrow_forward,
              size: 25,
            ),
            onDone: () => onDone(context),
            curve: Curves.bounceInOut,
          ),
        ));
  }
}
