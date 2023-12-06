import 'package:flutter/material.dart';
import 'package:user/services/uno.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(140), // 패딩 값을 줄입니다
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                forward.gg();
              },
              child: const Text('Go!'),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                stop.gg();
              },
              child: const Text('Stop!'),
            ),
          ],
        ));
  }
}
