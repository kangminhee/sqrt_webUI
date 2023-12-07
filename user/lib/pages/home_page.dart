import 'dart:html';

import 'package:flutter/material.dart';
import 'package:user/pages/cart.dart';
import 'package:user/pages/food_page.dart';
import 'package:user/pages/game_page.dart';
import 'package:user/pages/info_page.dart';
import 'package:socket_io_client/socket_io_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  void initState() {
    initSocket();
    super.initState();
  }

  late Socket socket;

  void initSocket() {
    socket = io('ws://112.219.28.28:3000', <String, dynamic>{
      // 'transports': ['websocket'],
    });

    socket.onConnect((_) {
      print('connected');
    });

    socket.onDisconnect((_) {
      print('disconnected');
    });

    socket.on('tong', (data) {
      print("ㅎㅎ: $data");
      myDialog(context);
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
      socket.emit('ting', '문정윤바보');
      print("dddd");
    } else {
      print('Socket is not connected.');
    }
  }
}

void myDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: double.infinity, // Full width
          height: 100, // Fixed height of 100
          padding: const EdgeInsets.all(10), // Padding for aesthetics
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "팝업이다.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10), // Spacing for a cleaner look
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                  tooltip: 'Close', // Tooltip for better UX
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


//
//   socket.onConnect((_) {
//     print('connect');
//     socket.emit('ping', 'message');
//   });
//   socket.on('pong', (data) => print(data));
//   socket.onDisconnect((_) => print('disconnect'));
//   socket.on('fromServer', (_) => print(_));