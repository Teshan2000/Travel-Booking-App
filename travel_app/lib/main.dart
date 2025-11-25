import 'package:flutter/material.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/login.dart';
import 'package:travel_app/screens/register.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Booking App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'home': (context) => Home(),
      },
    );
  }
}