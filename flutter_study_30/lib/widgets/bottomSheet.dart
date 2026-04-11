import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
              enableDrag: true,
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("This is a bottom sheet"),
                      subtitle: Text("You can show necessary information here"),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("This is a bottom sheet"),
                      subtitle: Text("You can show necessary information here"),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("This is a bottom sheet"),
                      subtitle: Text("You can show necessary information here"),
                    ),
                  ],
                );
              },
            );
          },
          child: Text("Show Bottom Sheet"),
        ),
      ),
    );
  }
}
