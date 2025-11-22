import 'package:flutter/material.dart';
import 'package:sales_bets/screens/main_navigation.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SalesBetsApp());
}

class SalesBetsApp extends StatelessWidget {
  const SalesBetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Bets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        primaryColor: Colors.deepPurpleAccent,
        textTheme: Typography.whiteMountainView,
      ),
      home: const MainNavigation(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
