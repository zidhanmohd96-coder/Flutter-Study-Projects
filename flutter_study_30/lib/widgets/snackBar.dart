import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View and Grid View'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            padding: EdgeInsets.all(20),
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            final snackbar = SnackBar(
              action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  print("Undo action pressed");
                },
              ),
              duration: Duration(milliseconds: 3000),
              elevation: 6,
              content: Text("This is a simple SnackBar"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: Text("Show SnackBar"),
        ),
      ),
    );
  }
}
