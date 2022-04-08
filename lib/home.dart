import 'package:flutter/material.dart';
import 'package:raider_io_flutter/Database/PlayerDao.dart';
import 'package:raider_io_flutter/Screens/search_screen.dart';
import 'package:raider_io_flutter/Screens/saved_data_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavBottomItem = 1;

  final List<Widget> _pageList = [
    SavedData(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raider IO'),
      ),
      body: _pageList.elementAt(_currentNavBottomItem),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo.shade500,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Saved data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _currentNavBottomItem,
        onTap: (value) {
          setState(() {
            _currentNavBottomItem = value;
          });
        },
      ),
    );
  }
}
