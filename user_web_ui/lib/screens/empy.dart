import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('빈 화면'),
        ),
        body: const Center(
          child: Text('여기가 빈 화면입니다.'),
        ),
      ),
    );
  }
}
