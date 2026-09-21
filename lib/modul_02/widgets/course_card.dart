import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Color statusBg;
    Color noteBg;

    if (course.status == 'Berlangsung') {
      statusColor = const Color(0xff1683d8);
      statusBg = const Color(0xff1683d8);
      noteBg = const Color(0xffdff1ff);
    } else if (course.status == 'Akan datang') {
      statusColor = const Color(0xffa96800);
      statusBg = const Color(0xffffe6a8);
      noteBg = const Color(0xfffff5dc);
    } else {
      statusColor = const Color(0xff68707d);
      statusBg = const Color(0xffe5e7eb);
      noteBg = const Color(0xffeef0f2);
    }

    return Container(
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
              Expanded(
                child: Text(
                  course.name,
                  style: const TextStyle(
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
                  color: statusBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  course.status,
                  style: TextStyle(
                    color: course.status == 'Berlangsung'
                        ? Colors.white
                        : statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: Color(0xff667085),
              ),
              const SizedBox(width: 6),
              Text(
                course.waktu,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff30343b),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 16,
                color: Color(0xff667085),
              ),
              const SizedBox(width: 6),
              Text(
                course.room,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff30343b),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              color: noteBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  course.status == 'Berlangsung'
                      ? Icons.groups
                      : course.status == 'Akan datang'
                          ? Icons.access_time
                          : Icons.check_circle,
                  size: 17,
                  color: statusColor,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    course.note,
                    style: TextStyle(
                      fontSize: 11,
                      color: statusColor,
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