import 'package:assignment/app/data/models/music_model.dart';
import 'package:assignment/app/data/remote/itune/itune_remote_data_source_impl.dart';
import 'package:assignment/app/locator.dart';

import 'music_repository.dart';

class MusicRepositoryImpl implements BaseMusicRepository {
  @override
  Future<MusicModel> getMusic({required String term}) {
    return locator.get<ItuneRemoteDataSourceImpl>().getItuneMusic(term: term);
  }
}
