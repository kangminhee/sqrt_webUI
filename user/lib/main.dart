import 'package:flutter/material.dart';
import 'package:user/models/cartmodel.dart'; // CartModel을 임포트
import 'package:user/pages/home_page.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartModel>(
      model: CartModel(), // CartModel 인스턴스 생성
      child: MaterialApp(
        title: 'SsQqRrTt',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
