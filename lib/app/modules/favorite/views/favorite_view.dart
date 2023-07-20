import 'package:assignment/app/core/widgets/custom_body.dart';
import 'package:assignment/app/core/widgets/loading.dart';
import 'package:assignment/app/core/widgets/music_result.dart';
import 'package:assignment/app/data/models/music_model.dart';
import 'package:assignment/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    FavoriteController favoriteController = locator.get<FavoriteController>();
    return Scaffold(
      appBar: _appbar(favoriteController, context),
      body: CustomBody(
        widget: favoriteContent(favoriteController, context, width),
      ),
    );
  }

  AppBar _appbar(FavoriteController favoriteController, BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Obx(
        () => favoriteController.isLoading.value
            ? const Loading()
            : Text(
                "My Favorite",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ),
    );
  }

  Obx favoriteContent(FavoriteController favoriteController,
      BuildContext context, double width) {
    return Obx(
      () => favoriteController.favoriteList.isEmpty
          ? Text(
              'You have no songs yet...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            )
          : ListView.builder(
              itemCount: favoriteController.favoriteList.length,
              itemBuilder: (BuildContext context, int index) {
                MusicResults musicResults =
                    favoriteController.favoriteList[index];
                return MusicResult(
                  width: width,
                  musicResults: musicResults,
                  isLiked: true,
                );
              },
            ),
    );
  }
}
