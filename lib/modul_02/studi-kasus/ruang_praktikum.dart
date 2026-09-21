import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';
import '../widgets/header_banner.dart';

class RuangPraktikum extends StatelessWidget {
  const RuangPraktikum({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = Course.getSampleCourses();
    final width = MediaQuery.of(context).size.width;
    final isTablet = width >= 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isTablet ? 22 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBanner(),

              const SizedBox(height: 20),

              if (isTablet)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CourseCard(
                        course: courses[0],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CourseCard(
                        course: courses[1],
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    CourseCard(
                      course: courses[0],
                    ),
                    const SizedBox(height: 8),
                    CourseCard(
                      course: courses[1],
                    ),
                  ],
                ),

              const SizedBox(height: 8),

              if (isTablet)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CourseCard(
                        course: courses[2],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _availableRoom(),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    CourseCard(
                      course: courses[2],
                    ),
                    const SizedBox(height: 8),
                    _availableRoom(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

Widget _availableRoom() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xfff1f4f8),
      borderRadius: BorderRadius.circular(14),
      boxShadow: const [
        BoxShadow(
          blurRadius: 2,
          offset: Offset(0, 1),
          color: Color(0x22000000),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Lab 2',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffd9f2e5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'Tersedia',
                style: TextStyle(
                  color: Color(0xff29985d),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 9),

        const Row(
          children: [
            Icon(
              Icons.access_time,
              size: 16,
              color: Color(0xff667085),
            ),
            SizedBox(width: 6),
            Text(
              '08.00 – 10.00',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        const Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16,
              color: Color(0xff667085),
            ),
            SizedBox(width: 6),
            Text(
              'Lab 2',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffdff5e9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.meeting_room,
                size: 17,
                color: Color(0xff29985d),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Siap digunakan untuk praktikum lain',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff29985d),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}