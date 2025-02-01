import 'package:flutter/material.dart';
import 'implicit_animations.dart';
import 'explicit_animations.dart';
import 'hero_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Explore Different Types of Animations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            _buildAnimationButton(
              context,
              'Implicit Animations',
              'Automatically animate size, color, opacity, and alignment.',
              Icons.animation,
              ImplicitAnimationsScreen(),
            ),
            SizedBox(height: 20),
            _buildAnimationButton(
              context,
              'Explicit Animations',
              'Manually control scaling animations with start/reverse buttons.',
              Icons.touch_app,
              ExplicitAnimationsScreen(),
            ),
            SizedBox(height: 20),
            _buildAnimationButton(
              context,
              'Hero Animation',
              'Tap the widget to see a smooth transition between screens.',
              Icons.flight_takeoff,
              HeroAnimationScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimationButton(BuildContext context, String title, String description, IconData icon, Widget screen) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}