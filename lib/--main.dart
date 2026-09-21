import 'package:flutter/material.dart';
import 'modul_02/studi-kasus/ruang_praktikum.dart';

void main() {
  runApp(const PoliwangiStarterApp());
}

class PoliwangiStarterApp extends StatelessWidget {
  const PoliwangiStarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poliwangi Mobile Codelabs 2026',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0284c7),
        ),
        brightness: Brightness.light,
      ),
      home: const RuangPraktikum(),
    );
  }
}