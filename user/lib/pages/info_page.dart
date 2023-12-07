import 'dart:ui';

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
    return Center(
      // Center 위젯을 사용하여 화면 중앙에 배치
      child: SizedBox(
        // SizedBox를 사용하여 버튼 크기를 50x50으로 지정
        width: 300,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            OrderApi();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero, // 버튼 내부의 패딩을 제거
          ),
          child: const Text(
            'Come on!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
