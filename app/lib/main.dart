import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const GarApp());
}

class GarApp extends StatelessWidget {
  const GarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GAR App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: GarColors.primary,
        useMaterial3: true,
        scaffoldBackgroundColor: GarColors.background,
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}

class GarColors {
  static const Color primary = Color(0xFF04ABB1); // sprite color
  //static const Color primary = Color(0xFF00AFAF);
  static const Color primaryDark = Color(0xFF007E7E);
  static const Color background = Color(0xFFF4F8F8);
  static const Color textDark = Color(0xFF123333);
  static const Color card = Colors.white;
}