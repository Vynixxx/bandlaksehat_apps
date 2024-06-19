import 'package:flutter/material.dart';
import 'package:bandlaksehat_apps/splashScreen.dart';
import 'package:bandlaksehat_apps/login_screen.dart';
import 'package:bandlaksehat_apps/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Rujukan Kesehatan Bandar Laksamana',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterForm(),
      },
    );
  }
}
