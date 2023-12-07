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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("호출"),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    left.gg();
                  },
                  child: const Text('Left!'),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    forward.gg();
                  },
                  child: const Text('Forward!'),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    right.gg();
                  },
                  child: const Text('right!'),
                ),
              ],
            )
          ],
        ));
  }
}
