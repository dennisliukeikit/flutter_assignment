import 'package:assignment/app/core/theme/app_colors.dart';
import 'package:assignment/app/data/models/models.dart';
import 'package:assignment/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/music_repository/music_repository_impl.dart';

class MusicController extends GetxController {
  MusicRepositoryImpl musicRepositoryImpl = locator.get<MusicRepositoryImpl>();
  final searchFormKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  var music = MusicModel.empty.obs;
  var isLoading = false.obs;

  Future<void> getMusic() async {
    try {
      isLoading(true);

      MusicModel response =
          await musicRepositoryImpl.getMusic(term: searchController.text);

      music.value = response;

      isLoading(false);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Please check your input or internet connection!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.blueColor,
        colorText: AppColors.whiteColor,
      );
      isLoading(false);
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
