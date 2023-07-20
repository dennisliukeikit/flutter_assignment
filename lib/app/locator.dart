import 'package:assignment/app/data/local/preference/preference_manager_impl.dart';
import 'package:assignment/app/data/remote/itune/itune_remote_data_source_impl.dart';
import 'package:assignment/app/data/repositories/favorite_repositary/favorite_repository_impl.dart';
import 'package:assignment/app/data/repositories/music_repository/music_repository_impl.dart';
import 'package:assignment/app/modules/detail/controllers/detail_controller.dart';
import 'package:assignment/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:assignment/app/modules/music/controllers/music_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<PreferenceManagerImpl>(
      () => PreferenceManagerImpl());
  locator.registerLazySingleton<ItuneRemoteDataSourceImpl>(
      () => ItuneRemoteDataSourceImpl());
  locator
      .registerLazySingleton<MusicRepositoryImpl>(() => MusicRepositoryImpl());
  locator.registerLazySingleton<FavoriteRepositoryImpl>(
      () => FavoriteRepositoryImpl());

  locator.registerLazySingleton<MusicController>(() => MusicController());
  locator.registerLazySingleton<DetailController>(() => DetailController());
  locator.registerLazySingleton<FavoriteController>(() => FavoriteController());
}
