import 'dart:convert';

import 'package:assignment/app/data/models/music_model.dart';
import 'package:assignment/app/data/remote/itune/itune_remote_data_source.dart';
import 'package:http/http.dart' as http;

class ItuneRemoteDataSourceImpl implements ItuneRemoteDataSource {
  @override
  Future<MusicModel> getItuneMusic({required String term}) async {
    String searchTerm = term.replaceAll(" ", "+");

    Uri url = Uri.parse(
        "https://itunes.apple.com/search?term=$searchTerm&entity=song");
    try {
      http.Response response = await http.get(url);

      return MusicModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
