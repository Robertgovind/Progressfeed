import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash_screen.png"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
