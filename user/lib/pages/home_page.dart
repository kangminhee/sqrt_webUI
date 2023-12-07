import 'dart:html';

import 'package:flutter/material.dart';
import 'package:user/pages/cart.dart';
import 'package:user/pages/food_page.dart';
import 'package:user/pages/game_page.dart';
import 'package:user/pages/info_page.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    initSocket();
    super.initState();
  }

  int _selectedIndex = 0;

  late IO.Socket socket;

  void initSocket() {
    socket = IO.io('ws://112.219.28.28:3000', <String, dynamic>{
      // 'transports': ['websocket'],
    });

    socket.onConnect((_) {
      print('connected');
    });

    socket.onDisconnect((_) {
      print('disconnected');
    });

    socket.on('pong', (data) {
      print(data);
      // setState(() {
      //    // 여기에 print 문 추가
      // });
    });
  }

  final List<Widget> _widgetOptions = [
    const InfoPage(),
    const FoodPage(),
    const GamePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Game',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: (_selectedIndex == 1 || _selectedIndex == 2)
          ? FloatingActionButton(
              child: const Icon(Icons.shopping_basket),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const CartPage();
                    },
                  ),
                );
              },
            )
          : null,
    );
  }

  void _onItemTapped(int index) {
    print('$index');
    setState(() {
      _selectedIndex = index;
    });

    if (socket.connected) {
      socket.emit('ping', '문정윤바보');
      print("dddd");
    } else {
      print('Socket is not connected.');
    }
  }
}

//
//   socket.onConnect((_) {
//     print('connect');
//     socket.emit('ping', 'message');
//   });
//   socket.on('pong', (data) => print(data));
//   socket.onDisconnect((_) => print('disconnect'));
//   socket.on('fromServer', (_) => print(_));