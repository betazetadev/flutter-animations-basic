import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Hero Transition',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Tap the widget to see a smooth transition to the next screen.'),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HeroDetailScreen()),
                  );
                },
                child: Hero(
                  tag: 'heroTag',
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.teal,
                    child: Center(
                      child: Text(
                        'Tap Me!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class HeroDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Detail'),
      ),
      body: Center(
        child: Hero(
          tag: 'heroTag',
          child: Container(
            width: 300,
            height: 300,
            color: Colors.teal,
            child: Center(
              child: Text(
                'Hero Widget',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}