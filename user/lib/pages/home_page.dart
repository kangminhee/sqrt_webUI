import 'dart:html';

import 'package:flutter/material.dart';
import 'package:user/pages/cart.dart';
import 'package:user/pages/food_page.dart';
import 'package:user/pages/game_page.dart';
import 'package:user/pages/info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

//   final WebSocketChannel channel =
//       IOWebSocketChannel.connect('http://112.219.28.28:3000');

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   final _websocketManager = WebSocketManager();

//   @override
//     void sendMessage('안녕') {}

  int _selectedIndex = 0;

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
    setState(() {
      _selectedIndex = index;
    });
  }
}
