import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  @override
  _ExplicitAnimationsScreenState createState() => _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 100, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _startAnimation() {
    _controller.forward();
    setState(() {
      _isAnimating = true;
    });
  }

  void _reverseAnimation() {
    _controller.reverse();
    setState(() {
      _isAnimating = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Scaling Animation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Use the buttons to start or reverse the animation.'),
            SizedBox(height: 20),
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: _animation.value,
                    height: _animation.value,
                    color: Colors.purple,
                    child: Center(
                      child: Text(
                        _isAnimating ? 'Expanding' : 'Shrinking',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startAnimation,
                  child: Text('Start Animation'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _reverseAnimation,
                  child: Text('Reverse Animation'),
                ),
              ],
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