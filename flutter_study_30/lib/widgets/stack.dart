import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Widget'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 30,
            child: Container(
              height: 300,
              width: 200,

              decoration: BoxDecoration(
                color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage('assets/cv_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red.withOpacity(0.5),
            ),
          ),
        ],
      ),
      // Container(
      //   color: Colors.blue,
      //   child: Stack(
      //     children: [
      //       Positioned(
      //         top: 20,
      //         left: 20,
      //         child: Container(height: 400, width: 400, color: Colors.red),
      //       ),
      //       Positioned(
      //         top: 20,
      //         right: 20,
      //         child: Container(height: 300, width: 300, color: Colors.yellow),
      //       ),
      //       Positioned(
      //         bottom: 20,
      //         left: 20,
      //         child: Container(height: 200, width: 200, color: Colors.green),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
