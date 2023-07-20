import 'package:assignment/app/data/models/models.dart';

abstract class BaseMusicRepository {
  Future<MusicModel> getMusic({required String term});
}
