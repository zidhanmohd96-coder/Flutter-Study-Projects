import 'package:flutter/material.dart';

class ContainerSized extends StatelessWidget {
  const ContainerSized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Container and SizedBox',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Center(child: Text("This is a simple SizedBox")),
              height: 100,
              width: 100,
            ),
            Container(
              child: Center(child: Text("This is a simple Container1")),
              height: 100,
              width: 100,
              color: Colors.deepPurpleAccent,
            ),
            Container(
              child: Center(child: Text("This is a simple Container2")),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 100,
            ),

            Container(
              child: Center(
                child: Text(
                  "This is a simple Container2",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 2.5,
                    color: Colors.white,
                  ),
                ],
              ),
              height: 100,
              width: 100,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(child: Container(color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 100,
            ),
            Container(
              child: Center(
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
