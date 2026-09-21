import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ruang Praktikum Hari Ini',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _badge(
              Icons.calendar_month,
              '3 sesi',
            ),
            const SizedBox(width: 8),
            _badge(
              Icons.meeting_room,
              '1 ruang tersedia',
            ),
          ],
        ),
      ],
    );
  }

  Widget _badge(
    IconData icon,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffe5f2ff),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 14,
            color: const Color(0xff1683d8),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xff1683d8),
            ),
          ),
        ],
      ),
    );
  }
}