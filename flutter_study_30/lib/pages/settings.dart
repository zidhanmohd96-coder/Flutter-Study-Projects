import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

final user = FirebaseAuth.instance.currentUser;
final String? email = user?.email;

final Uri _url = Uri.parse(
  'https://github.com/zidhanmohd96-coder/Flutter-Study-Projects/tree/master/flutter_study_30',
);

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _launchRepo() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: Text("Settings"), elevation: 5),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(email!, style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Darkmode",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (bool value) {
                      // Toggle theme via provider
                      themeProvider.toggleTheme(value);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextButton(
                onPressed: () async {
                  final bool launched = await launchUrl(
                    _url,
                    mode: LaunchMode.externalApplication,
                  );
                  if (!launched) {
                    debugPrint("Failed to launch URL");
                  }
                },
                child: Text(
                  "Full Source Code(Github Link)↗",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(
                    Colors.redAccent,
                  ),
                ),
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
