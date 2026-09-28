import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/announcement_list_screen.dart';

class Modul04App extends StatelessWidget {
  const Modul04App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: _Modul04AppView(),
    );
  }
}

class _Modul04AppView extends StatelessWidget {
  const _Modul04AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modul 04 - Fase B',
      home: const AnnouncementListScreenB(),
    );
  }
}