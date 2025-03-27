import 'dart:async';
import 'package:flutter/material.dart';

import '../signin/signin_page.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool? boolValue1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    Timer(Duration(seconds: 3), () {
      checkValidUser(); // Check if the user is already signed in
    });
  }

  checkValidUser() async {

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(
                    'assets/test.jpeg'), // Replace 'image.png' with your asset image path
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
