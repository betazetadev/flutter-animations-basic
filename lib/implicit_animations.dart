import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  @override
  _ImplicitAnimationsScreenState createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _expanded = false;
  bool _visible = true;
  Alignment _alignment = Alignment.topLeft;

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  void _toggleVisibility() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topLeft
          ? Alignment.bottomRight
          : Alignment.topLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. AnimatedContainer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Tap the button to toggle size and color.'),
            SizedBox(height: 10),
            Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _expanded ? 200 : 100,
                height: _expanded ? 200 : 100,
                color: _expanded ? Colors.blue : Colors.red,
                child: Center(
                  child: Text(
                    _expanded ? 'Expanded' : 'Small',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleExpanded,
              child: Text('Toggle Container'),
            ),
            SizedBox(height: 30),
            Text(
              '2. AnimatedOpacity',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Tap the button to toggle visibility.'),
            SizedBox(height: 10),
            Center(
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      _visible ? 'Visible' : 'Invisible',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text('Toggle Opacity'),
            ),
            SizedBox(height: 30),
            Text(
              '3. AnimatedAlign',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Tap the button to change alignment.'),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[200],
              child: AnimatedAlign(
                alignment: _alignment,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      _alignment == Alignment.topLeft
                          ? 'Top Left'
                          : 'Bottom Right',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeAlignment,
              child: Text('Change Alignment'),
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