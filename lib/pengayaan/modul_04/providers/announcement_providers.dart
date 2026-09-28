import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modul_04/models/announcement.dart';

import '../datasources/announcement_remote_data_source.dart';

import '../repositories/announcement_repository.dart';
import '../repositories/announcement_repository_impl.dart';
import '../repositories/sample_announcement_repository.dart';

final useSampleDataProvider = Provider<bool>((ref) {
  const value = bool.fromEnvironment(
    'USE_SAMPLE_DATA',
    defaultValue: false,
  );

  return value;
});

final announcementRepositoryProvider =
    Provider<AnnouncementRepository>((ref) {
  final useSampleData = ref.watch(useSampleDataProvider);

  if (useSampleData) {
    return SampleAnnouncementRepository();
  }

  return AnnouncementRepositoryImpl(
    remoteDataSource: AnnouncementRemoteDataSource(),
  );
});

class SelectedCategoryNotifier
    extends Notifier<String> {
  @override
  String build() => 'Semua';

  void select(String kategori) {
    state = kategori;
  }
}

final selectedCategoryProvider =
    NotifierProvider<SelectedCategoryNotifier, String>(
  SelectedCategoryNotifier.new,
);

final announcementsProvider =
    FutureProvider<List<Announcement>>((ref) async {
  final repository =
      ref.watch(announcementRepositoryProvider);

  final category =
      ref.watch(selectedCategoryProvider);

  return repository.getAnnouncements(
    category: category,
  );
});