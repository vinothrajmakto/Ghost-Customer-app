import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the Rive animation controller
    _controller = SimpleAnimation('AnimationName'); // Replace with the name of your animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when not in use
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rive Animation')),
      body: Center(
        child: RiveAnimation.asset(
          'assets/jsons/Animation - 1728995668629.json',
          controllers: [_controller],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
