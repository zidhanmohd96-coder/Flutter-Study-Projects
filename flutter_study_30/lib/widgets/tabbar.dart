import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar Widget"),

          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
              Tab(icon: Icon(Icons.person), text: "Profile"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.red,
              child: Center(child: Text("Home Tab")),
            ),
            Container(
              color: Colors.green,
              child: Center(child: Text("Settings Tab")),
            ),
            Container(
              color: Colors.blue,
              child: Center(child: Text("Profile Tab")),
            ),
          ],
        ),
      ),
    );
  }
}
