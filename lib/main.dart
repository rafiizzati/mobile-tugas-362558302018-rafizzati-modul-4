import 'package:flutter/material.dart';

import 'modul_04/screens/announcement_list_screen.dart';
import 'modul_04/services/announcement_api.dart';

void main() {
  runApp(const Modul04App());
}

class Modul04App extends StatelessWidget {
  const Modul04App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal Pengumuman TRPL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E6FD9),
        ),
        useMaterial3: true,
      ),
      home: AnnouncementListScreen(
        api: AnnouncementApi(
          modeSimulasi: true,
        ),
      ),
    );
  }
}