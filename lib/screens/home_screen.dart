import 'package:flutter/material.dart';
import 'calendar_page.dart';
import 'home_page.dart';
import 'list_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = [HomePage(), CalendarPage(), ListPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pinkAccent,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ("ホーム"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: ("カレンダー"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: ("一覧"),
            ),
          ],
          onTap: (index) {
            setState(() {});
            _currentIndex = index;
          },
        ),
      ),
    );
  }
}
