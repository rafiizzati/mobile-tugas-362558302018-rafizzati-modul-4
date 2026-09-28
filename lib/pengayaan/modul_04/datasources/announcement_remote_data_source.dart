import 'package:dio/dio.dart';

import '../../../modul_04/models/announcement.dart';

class AnnouncementRemoteDataSource {
  final Dio _dio;

  AnnouncementRemoteDataSource({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://jsonplaceholder.typicode.com',
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
                sendTimeout: const Duration(seconds: 10),
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json',
                },
              ),
            );

  Future<List<Announcement>> getAnnouncements({
    String? category,
  }) async {
    final response = await _dio.get('/posts');

    final data = response.data;

    if (data is! List) {
      throw Exception('Format data dari server tidak valid.');
    }

    final announcements = data
        .take(10)
        .map(
          (item) => Announcement.fromJson(
            Map<String, dynamic>.from(item as Map),
          ),
        )
        .toList();

    if (category == null || category == 'Semua') {
      return announcements;
    }

    return announcements
        .where(
          (item) =>
              item.category.toLowerCase() ==
              category.toLowerCase(),
        )
        .toList();
  }

  Future<Announcement> addAnnouncement(
    Announcement announcement,
  ) async {
    final response = await _dio.post(
      '/posts',
      data: announcement.toJson(),
    );

    return Announcement.fromJson(
      Map<String, dynamic>.from(response.data as Map),
    );
  }
}