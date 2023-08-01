import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter value: $counter',
              style: TextStyle(fontSize: 22, color: Colors.amber),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ++counter;
                });
              },
              child: Text('Increment'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  --counter;
                });
                if (counter == 0) {
                  _showSnackBar(context,
                      'Counter reached zero!'); // Display a snackbar when the counter reaches zero
                }
              },
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2), // Display the snackbar for 2 seconds
      ),
    );
  }
}
