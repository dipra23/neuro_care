import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../progress/Achievements.dart';
import '/homepage/homepage.dart';

import '../profile/profile.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  List _pages = [
    Homepage(),
    Achievements(),
    Profile(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFF887BB0),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: translate('bottom_nav.home')),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: translate('bottom_nav.achievements')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: translate('bottom_nav.profile')),

        ],
      ),
    );
  }
}