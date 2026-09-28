import 'package:dio/dio.dart';

import '../../../modul_04/models/announcement.dart';
import '../datasources/announcement_remote_data_source.dart';
import 'announcement_repository.dart';

class AnnouncementRepositoryImpl
    implements AnnouncementRepository {
  final AnnouncementRemoteDataSource _remoteDataSource;

  AnnouncementRepositoryImpl({
    AnnouncementRemoteDataSource? remoteDataSource,
  }) : _remoteDataSource =
            remoteDataSource ??
            AnnouncementRemoteDataSource();

  @override
  Future<List<Announcement>> getAnnouncements({
    String? category,
  }) async {
    try {
      return await _remoteDataSource.getAnnouncements(
        category: category,
      );
    } on DioException catch (e) {
      throw Exception(
        e.message ?? 'Terjadi kesalahan jaringan',
      );
    }
  }

  @override
  Future<Announcement> addAnnouncement(
    Announcement announcement,
  ) async {
    try {
      return await _remoteDataSource.addAnnouncement(
        announcement,
      );
    } on DioException catch (e) {
      throw Exception(
        e.message ?? 'Terjadi kesalahan jaringan',
      );
    }
  }
}