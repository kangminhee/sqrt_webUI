import 'package:flutter/material.dart';

class GameMenuTab extends StatelessWidget {
  const GameMenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('this is game menu tab'),
              const SizedBox(height: 10),
              const TextField(
                  decoration: InputDecoration(border: OutlineInputBorder())),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
