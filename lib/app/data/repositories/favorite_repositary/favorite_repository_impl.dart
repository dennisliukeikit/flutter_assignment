import 'dart:convert';

import 'package:assignment/app/data/local/preference/preference_manager_impl.dart';
import 'package:assignment/app/data/models/music_model.dart';
import 'package:assignment/app/data/repositories/favorite_repositary/favorite_repository.dart';
import 'package:assignment/app/locator.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  PreferenceManagerImpl preferenceManagerImpl =
      locator.get<PreferenceManagerImpl>();
  static const _favoriteKey = "favorite_key";

  @override
  Future<List<MusicResults>> getFavoriteList() async {
    List<MusicResults> favoriteList = <MusicResults>[];
    String? response = await preferenceManagerImpl.getString(_favoriteKey);
    if (response == "") {
      return favoriteList;
    } else {
      Map<String, dynamic> data = jsonDecode(response);
      data['results'].forEach((v) {
        favoriteList.add(MusicResults.fromJson(v));
      });
      return favoriteList;
    }
  }

  @override
  Future<void> addFavorite({required MusicResults musicResults}) async {
    String? response = await preferenceManagerImpl.getString(_favoriteKey);
    List<MusicResults> favoriteList = <MusicResults>[];

    if (response == "") {
      Map<String, dynamic> data = <String, dynamic>{};
      data['results'] = [musicResults].map((v) => v.toJson()).toList();

      await preferenceManagerImpl.setString(_favoriteKey, jsonEncode(data));
    } else {
      Map<String, dynamic> data = jsonDecode(response);
      data['results'].forEach((v) {
        favoriteList.add(MusicResults.fromJson(v));
      });
      favoriteList.add(musicResults);

      data['results'] = favoriteList.map((v) => v.toJson()).toList();
      await preferenceManagerImpl.setString(_favoriteKey, jsonEncode(data));
    }
  }

  @override
  Future<void> removeFavorite({required MusicResults musicResults}) async {
    String? response = await preferenceManagerImpl.getString(_favoriteKey);
    List<MusicResults> favoriteList = <MusicResults>[];

    if (response == "") {
      return;
    } else {
      Map<String, dynamic> data = jsonDecode(response);
      data['results'].forEach((v) {
        favoriteList.add(MusicResults.fromJson(v));
      });
      favoriteList
          .removeWhere((result) => result.trackId == musicResults.trackId);
      data['results'] = favoriteList.map((v) => v.toJson()).toList();
      await preferenceManagerImpl.setString(_favoriteKey, jsonEncode(data));
    }
  }
}
