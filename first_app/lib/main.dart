// SakalWheels - UI screens (Splash, Welcome, Login)
// Single-file Flutter example (lib/main.dart)
// Replace assets/images placeholders with your images and add them to pubspec.yaml

import 'package:flutter/material.dart';

void main() {
  runApp(SakalWheelsApp());
}

class SakalWheelsApp extends StatelessWidget {
  const SakalWheelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SakalWheels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF6F6F4),
        primaryColor: AppColors.accentYellow,
        fontFamily: 'Sans',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => SplashScreen(),
        '/welcome': (_) => WelcomeScreen(),
        '/login': (_) => LoginScreen(),
      },
    );
  }
}

// ---------- Color Palette (from the provided UI) ----------
class AppColors {
  static const Color accentYellow = Color(0xFFD8FF00); // bright neon yellow
  static const Color deepBlack = Color(0xFF0A0A0A);
  static const Color softGray = Color(0xFFF6F6F4);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color subtleText = Color(0xFF6B6B6B);
}

// ---------------- Splash Screen ----------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1400), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.softGray,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo / Big Title
            Icon(
              Icons.directions_car_filled,
              size: 96,
              color: AppColors.deepBlack,
            ),
            SizedBox(height: 18),
            Text(
              'SakalWheels',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.deepBlack,
              ),
            ),
            SizedBox(height: 8),
            Opacity(
              opacity: 0.8,
              child: Text(
                'Rent Anything. Anytime. Anywhere.',
                style: TextStyle(color: AppColors.subtleText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Welcome Screen ----------------
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top big hero area
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.cardWhite,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(24),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/zimu.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // translucent gradient on top for contrast
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.22),
                          ],
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  // small back/menu icons row
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.menu, color: Colors.white),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white.withOpacity(0.9),
                            child: Icon(
                              Icons.notifications,
                              size: 18,
                              color: AppColors.deepBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom content card area
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Matcha 👋',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 46,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FilterPill(label: 'Cars', active: true),
                          FilterPill(label: 'Bikes'),
                          FilterPill(label: 'Trucks'),
                          FilterPill(label: 'Drivers'),
                          SizedBox(width: 4),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    // card with sample listing
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.cardWhite,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/zimu.jpg',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Whispering Pines Trail',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '01 day • ₹76',
                                        style: TextStyle(
                                          color: AppColors.subtleText,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 14,
                                        backgroundColor: AppColors.accentYellow,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.deepBlack,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),

                          // quick action column
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.map_outlined),
                                  color: AppColors.deepBlack,
                                ),
                                SizedBox(height: 12),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border),
                                  color: AppColors.deepBlack,
                                ),
                                SizedBox(height: 12),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.share_outlined),
                                  color: AppColors.deepBlack,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    // bottom call to action row
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accentYellow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: AppColors.deepBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.deepBlack,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Filter pill widget ----------
class FilterPill extends StatelessWidget {
  final String label;
  final bool active;
  const FilterPill({super.key, required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: active ? AppColors.deepBlack : AppColors.cardWhite,
        borderRadius: BorderRadius.circular(22),
        boxShadow: active
            ? [BoxShadow(color: Colors.black12, blurRadius: 6)]
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(color: active ? Colors.white : AppColors.deepBlack),
      ),
    );
  }
}

// ---------------- Login Screen ----------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
              ),
              SizedBox(height: 8),
              Text(
                'Welcome back',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                'Login to continue booking vehicles and drivers',
                style: TextStyle(color: AppColors.subtleText),
              ),

              SizedBox(height: 22),

              // phone input
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Text('+91', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter mobile number',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // simulate OTP flow - in real app call auth API
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('OTP Sent'),
                            content: Text(
                              'A one-time password has been sent to +91 ${_phoneController.text}',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: TextStyle(color: AppColors.deepBlack),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18),

              Center(
                child: Text(
                  'or connect with',
                  style: TextStyle(color: AppColors.subtleText),
                ),
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(label: 'Google', icon: Icons.g_mobiledata),
                  SizedBox(width: 12),
                  SocialButton(label: 'Facebook', icon: Icons.facebook),
                ],
              ),

              Spacer(),

              // small note and continue as guest
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
                child: Center(
                  child: Text(
                    'Continue as Guest',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ),

              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const SocialButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: AppColors.deepBlack),
      label: Text(label, style: TextStyle(color: AppColors.deepBlack)),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cardWhite,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// ---------------- End of file ----------------
