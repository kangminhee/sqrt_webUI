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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Column의 주 축 정렬을 중앙으로 설정
        children: [
          SizedBox(
            // 첫 번째 버튼
            width: 300,
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                // print("Come");
                Come();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // 버튼 내부의 패딩을 제거
              ),
              child: const Text(
                '호출!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50), // 버튼 사이의 간격을 50으로 설정
          SizedBox(
            // 두 번째 버튼
            width: 300,
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                print("return");
                Return();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // 버튼 내부의 패딩을 제거
              ),
              child: const Text(
                '돌려보내기!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
