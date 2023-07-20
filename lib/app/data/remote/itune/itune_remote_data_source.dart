import '../../models/models.dart';

abstract class ItuneRemoteDataSource {
  Future<MusicModel> getItuneMusic({required String term});
}
