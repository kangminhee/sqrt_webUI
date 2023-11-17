import 'package:flutter/material.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('this if info tab.'),
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
