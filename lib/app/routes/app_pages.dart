import 'package:get/get.dart';

import '../modules/detail/views/detail_view.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/music/views/music_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.MUSIC,
      page: () => const MusicView(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
    ),
  ];
}
