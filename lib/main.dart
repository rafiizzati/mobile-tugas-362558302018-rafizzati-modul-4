import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(const KantinApp());
}

class KantinApp extends StatelessWidget {
  const KantinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kantin Kampus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E6FD9)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}