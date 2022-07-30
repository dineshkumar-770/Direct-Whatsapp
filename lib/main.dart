import 'package:api_project/homepage.dart';
import 'package:api_project/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Direct WhatsApp',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        useMaterial3: true
      ),
      home: SplashScreen(),
    );
  }
}

