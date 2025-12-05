import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/login.dart';
import 'package:travel_app/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = FlutterSecureStorage();

  final accessToken = await storage.read(key: 'accessToken');
  runApp(MyApp(isLoggedIn: accessToken != null));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;
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
        '/': (context) => isLoggedIn ? Home() : LoginPage(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'home': (context) => Home(),
      },
    );
  }
}
