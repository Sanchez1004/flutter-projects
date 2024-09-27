import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Animated Container
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  // Opacity
  double opacityLevel = 1.0;

  void changeValues() {
    setState(() {
      final random = Random();
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(256, random.nextInt(256), random.nextInt(256), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  Center animatedContainer() {
    return Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 2),
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius:  _borderRadius,
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
          ),
        )
    );
  }


  // Interpolation
  double targetValue = 24.0;

  Center interpolationAnimation() {
    return Center(
      // Interpolation
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
            begin: 0,
            end: targetValue
        ),
        duration: const Duration(seconds: 1),
        builder: (BuildContext context, double size, Widget? child) {
          return IconButton(
            iconSize: size,
            color: Colors.blue,
            onPressed: () => setState(() {
              targetValue = targetValue == 24.0 ? 48.0 : 24.0;
            }),
            icon: child!,
          );
        },
        child: const Icon(Icons.aspect_ratio),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
        backgroundColor: Colors.deepOrange,
      ),
      // Call here the method of the animations u want to test
      // animatedContainer()
      // interpolationAnimation()
      body: animatedContainer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {changeValues()},
      ),
    );
  }
}