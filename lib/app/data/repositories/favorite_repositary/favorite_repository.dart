import 'package:assignment/app/data/models/music_model.dart';

abstract class FavoriteRepository {
  Future<List<MusicResults>> getFavoriteList();

  Future<void> addFavorite({required MusicResults musicResults});

  Future<void> removeFavorite({required MusicResults musicResults});
}
