import 'package:assignment/app/core/theme/app_colors.dart';
import 'package:assignment/app/core/theme/app_dimension.dart';
import 'package:assignment/app/core/utils/time_service.dart';
import 'package:assignment/app/core/widgets/custom_body.dart';
import 'package:assignment/app/core/widgets/custom_circle_button.dart';
import 'package:assignment/app/core/widgets/loading.dart';
import 'package:assignment/app/core/widgets/space_box.dart';
import 'package:assignment/app/data/models/models.dart';
import 'package:assignment/app/locator.dart';
import 'package:assignment/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DetailController detailController = locator.get<DetailController>();
    FavoriteController favoriteController = locator.get<FavoriteController>();
    MusicResults? musicResults = Get.arguments;
    return musicResults != null
        ? _successScreen(
            detailController, favoriteController, musicResults, context, width)
        : _errorScreen(context);
  }

  Scaffold _successScreen(
      DetailController detailController,
      FavoriteController favoriteController,
      MusicResults musicResults,
      BuildContext context,
      double width) {
    return Scaffold(
      appBar:
          _appbar(detailController, favoriteController, musicResults, context),
      body: CustomBody(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _musicTitle(width, musicResults, context),
            _musicTrack(context, detailController),
            _musicButton(detailController, musicResults),
          ],
        ),
      ),
    );
  }

  Scaffold _errorScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: CustomBody(
        widget: Center(
          child: Text(
            "Please check your internet connection",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  AppBar _appbar(
      DetailController detailController,
      FavoriteController favoriteController,
      MusicResults musicResults,
      BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          detailController.stopMusic();
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Obx(
        () => detailController.isLaoding.value
            ? const Loading()
            : const SizedBox.shrink(),
      ),
      actions: [
        Obx(
          () => IconButton(
            onPressed: () {
              if (favoriteController.isLoading.isFalse) {
                if (favoriteController.favoriteList
                    .where(
                        (favorite) => favorite.trackId == musicResults.trackId)
                    .isNotEmpty) {
                  favoriteController.removeFavorite(musicResults);
                } else {
                  favoriteController.addFavorite(musicResults);
                }
              }
            },
            icon: Icon(
              Icons.favorite,
              color: favoriteController.favoriteList
                      .where((favorite) =>
                          favorite.trackId == musicResults.trackId)
                      .isNotEmpty
                  ? AppColors.blueColor
                  : AppColors.greyColor,
            ),
          ),
        ),
      ],
    );
  }

  Column _musicTitle(
      double width, MusicResults musicResults, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width / 1.5,
          height: width / 1.5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(AppDimension.borderRadius)),
            child: Image.network(
              '${musicResults.artworkUrl100}',
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SpaceBox(
          size: 3,
        ),
        Text(
          "${musicResults.trackName}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SpaceBox(
          size: 1,
        ),
        Text(
          "${musicResults.artistName}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Obx _musicTrack(BuildContext context, DetailController detailController) {
    return Obx(
      () => Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.blueColor,
              inactiveTrackColor: AppColors.lightGreyColor,
              trackShape: const RectangularSliderTrackShape(),
              trackHeight: 5.0,
              thumbColor: AppColors.blueColor,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
            ),
            child: Slider(
              min: 0,
              max: detailController.duration.value.inSeconds.toDouble(),
              value:
                  detailController.durationPosition.value.inSeconds.toDouble(),
              onChanged: (value) async {
                detailController.setMusicPosition(value);
              },
            ),
          ),
          const SpaceBox(
            size: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TimeService.formatTime(
                    duration: detailController.durationPosition.value),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                TimeService.formatTime(
                    duration: detailController.duration.value -
                        detailController.durationPosition.value),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Obx _musicButton(
      DetailController detailController, MusicResults musicResults) {
    return Obx(
      () => CustomCircleButton(
        icon: detailController.isPlaying.value
            ? Icons.pause_outlined
            : Icons.play_arrow_rounded,
        iconColor: AppColors.whiteColor,
        buttonColor: AppColors.blueColor,
        onPressed: () async {
          if (detailController.isPlaying.value) {
            detailController.pauseMusic();
          } else {
            String url = musicResults.previewUrl ?? "";
            if (url.isNotEmpty) {
              detailController.playMusic(url);
            }
          }
        },
      ),
    );
  }
}
