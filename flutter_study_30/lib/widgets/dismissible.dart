import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  List<String> items = [
    "Flutter",
    "Dart",
    "Widget",
    "Stateful",
    "Stateless",
    "ListView",
    "GridView",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View and Grid View'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            background: Container(color: Colors.red),
            secondaryBackground: Container(color: Colors.green),
            onDismissed: (direction) {
              final removedItem = items[index];

              setState(() {
                items.removeAt(index);
              });

              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text("Item $removedItem dismissed"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text("Item $removedItem saved"),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: Card(child: ListTile(title: Text(items[index]))),
          );
        },
      ),
    );
  }
}
