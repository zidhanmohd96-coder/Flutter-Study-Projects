import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_study_30/firebaseAuthentication/firebaseAuthentication.dart';
import 'package:flutter_study_30/firebase_options.dart';
import 'package:flutter_study_30/graphs/cartesianChart.dart';
import 'package:flutter_study_30/graphs/liveChart.dart';
import 'package:flutter_study_30/graphs/pieChart.dart';
import 'package:flutter_study_30/graphs/radialChart.dart';
import 'package:flutter_study_30/pages/settings.dart';
import 'package:flutter_study_30/pages/toDo.dart';
import 'package:flutter_study_30/ui/overlapedAvatars_ui/overlappedAvatars.dart';
import 'package:flutter_study_30/widgets/database.dart';
import 'package:flutter_study_30/widgets/bottomNav.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNav();
          } else {
            return FirebaseAuthentication();
          }
        },
      ),
    );
  }
}
