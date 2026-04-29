import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_30/pages/home.dart';
import 'package:flutter_study_30/pages/settings.dart';
import 'package:flutter_study_30/pages/toDo.dart';
import 'package:flutter_study_30/widgets/bottomSheet.dart';
import 'package:flutter_study_30/widgets/dismissible.dart';
import 'package:flutter_study_30/widgets/drawer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  PageController pageController = PageController();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bottom Navigation'),
      //   elevation: 8,
      //   backgroundColor: Colors.indigo,
      // ),
      body: PageView(
        controller: pageController,
        children: [HomeScreen(), ToDoScreen(), SettingsScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'ToDo'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],

        unselectedItemColor: Colors.grey,
        elevation: 8,
      ),
    );
  }
}
