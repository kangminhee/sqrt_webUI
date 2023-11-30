import 'package:flutter/material.dart';
//import 'package:user_web_ui/screens/empy.dart';
import 'package:user_web_ui/screens/food_menu_tab.dart';
import 'package:user_web_ui/screens/game_menu_tab.dart';
import 'package:user_web_ui/screens/info_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const FoodMenuTab(),
    const GameMenuTab(),
    const InfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: (_selectedIndex == 0 || _selectedIndex == 1)
          ? FloatingActionButton(
              child: const Icon(Icons.shopping_basket),
              onPressed: () => _showPopup(context, '팝업팝업'),
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

void _showPopup(BuildContext context, String buttonText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('팝업 창'),
        content: Text('$buttonText 클릭됨'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // 팝업 창 닫기
            },
            child: const Text('닫기'),
          ),
        ],
      );
    },
  );
}
