import 'package:flutter/material.dart';
import 'splash_screen.dart'; 
import 'screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF1E4D45),
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const WelcomePage(), 
      },
    );
  }
}


