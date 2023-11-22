import 'package:flutter/material.dart';
import 'dart:async';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime serverTime = DateTime.now().subtract(const Duration(hours: 1));

    return Center(
      child: TimeElapsedWidget(serverTime: serverTime),
    );
  }
}

class TimeElapsedWidget extends StatefulWidget {
  final DateTime serverTime; // API 서버로부터 받은 시간
  const TimeElapsedWidget({Key? key, required this.serverTime})
      : super(key: key);

  @override
  _TimeElapsedWidgetState createState() => _TimeElapsedWidgetState();
}

class _TimeElapsedWidgetState extends State<TimeElapsedWidget> {
  Timer? _timer;
  Duration _timeElapsed = const Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeElapsed = DateTime.now().difference(widget.serverTime);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '경과 시간: ${_timeElapsed.inHours}:${_timeElapsed.inMinutes % 60}:${_timeElapsed.inSeconds % 60}',
      style: const TextStyle(fontSize: 24),
    );
  }
}
