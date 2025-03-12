import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmergencyPage(),
    );
  }
}

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  bool _isConfirmationVisible = false;
  Timer? _confirmationTimer;

  @override
  void dispose() {
    _confirmationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Page'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            _showConfirmationDialog(context);
          },
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Text(
                'Emergency',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _isConfirmationVisible
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isConfirmationVisible = false;
                });
              },
              child: const Icon(Icons.close),
              backgroundColor: Colors.red,
            )
          : null,
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Emergency Confirmation'),
          content: const Text('Do you want to cancel?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _startCancellationTimer();
                setState(() {
                  _isConfirmationVisible = true;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _startCancellationTimer() {
    _confirmationTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _isConfirmationVisible = false;
      });
    });
  }
}
