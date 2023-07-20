import 'package:assignment/app/data/models/music_model.dart';
import 'package:assignment/app/data/repositories/favorite_repositary/favorite_repository_impl.dart';
import 'package:assignment/app/locator.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  FavoriteRepositoryImpl favoriteRepository =
      locator.get<FavoriteRepositoryImpl>();
  var favoriteList = List<MusicResults>.empty().obs;
  var isLoading = false.obs;

  void getFavoriteList() async {
    isLoading(true);

    List<MusicResults> response = await favoriteRepository.getFavoriteList();
    favoriteList.value = response;

    isLoading(false);
  }

  void addFavorite(MusicResults musicResults) async {
    isLoading(true);

    await favoriteRepository.addFavorite(musicResults: musicResults);
    getFavoriteList();

    isLoading(false);
  }

  void removeFavorite(MusicResults musicResults) async {
    isLoading(true);

    await favoriteRepository.removeFavorite(musicResults: musicResults);
    getFavoriteList();

    isLoading(false);
  }
}
