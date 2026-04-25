import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  final String code = '''
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Widget'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showMyDialog(context);
              },
              child: Text('Show Alert'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext ctx) async {
  return showDialog(
    context: ctx,
    builder: (BuildContext ctx) {
      return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 24,
        title: Text("This is an Alert Dialog"),
        content: SingleChildScrollView(
          child: Text(
            "Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time.",
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text("Okayy")),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Cancel"),
          ),
        ],
      );
    },
  );
}

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Widget'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showMyDialog(context);
                },
                child: Text('Show Alert'),
              ),
              SizedBox(height: 10),
              HighlightView(
                code,
                language: 'dart',
                theme: draculaTheme,
                padding: EdgeInsets.all(12),
                textStyle: TextStyle(fontFamily: 'monospace', fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext ctx) async {
  return showDialog(
    context: ctx,
    builder: (BuildContext ctx) {
      return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 24,
        title: Text("This is an Alert Dialog"),
        content: SingleChildScrollView(
          child: Text(
            "Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time.",
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text("Okayy")),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Cancel"),
          ),
        ],
      );
    },
  );
}
