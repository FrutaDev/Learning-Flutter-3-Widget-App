import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = "animated_screen";

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double radius = 10.0;

  void changeAppearance() {
    setState(() {
      final random = Random();

      width = random.nextInt(300) + 120;
      height = random.nextInt(300) + 120;
      color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1
      );
      radius = random.nextInt(100) + 25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius <= 0 ? 0 : radius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: changeAppearance,
        child: Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
