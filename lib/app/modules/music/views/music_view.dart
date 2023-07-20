import 'package:assignment/app/core/theme/app_colors.dart';
import 'package:assignment/app/core/theme/app_dimension.dart';
import 'package:assignment/app/core/widgets/custom_body.dart';
import 'package:assignment/app/core/widgets/custom_circle_button.dart';
import 'package:assignment/app/core/widgets/loading.dart';
import 'package:assignment/app/core/widgets/music_result.dart';
import 'package:assignment/app/core/widgets/space_box.dart';
import 'package:assignment/app/data/models/models.dart';
import 'package:assignment/app/locator.dart';
import 'package:assignment/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:assignment/app/modules/favorite/views/favorite_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/music_controller.dart';

class MusicView extends GetView<MusicController> {
  const MusicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    MusicController musicController = locator.get<MusicController>();
    FavoriteController favoriteController = locator.get<FavoriteController>();
    return Scaffold(
      appBar: _appbar(musicController, context),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: CustomBody(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _searchSection(
                musicController,
                context,
              ),
              const SpaceBox(
                size: 1,
              ),
              _resultSection(
                musicController,
                favoriteController,
                width,
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appbar(MusicController musicController, BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Obx(
        () => musicController.isLoading.value
            ? const Loading()
            : Text(
                "Music",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => const FavoriteView());
          },
          icon: const Icon(
            Icons.favorite_border_outlined,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  Form _searchSection(MusicController musicController, BuildContext context) {
    return Form(
      key: musicController.searchFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What kind of music do you want to listen today?',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SpaceBox(
            size: 1,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: musicController.searchController,
                  decoration: const InputDecoration(
                    hintText: "search...",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              const SpaceBox(
                size: 1,
              ),
              CustomCircleButton(
                icon: Icons.send_rounded,
                iconColor: AppColors.whiteColor,
                buttonColor: AppColors.blueColor,
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  if (musicController.isLoading.isFalse) {
                    locator.get<MusicController>().getMusic();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _resultSection(
      MusicController musicController,
      FavoriteController favoriteController,
      double width,
      BuildContext context) {
    return Expanded(
      child: Obx(
        () => Column(
          children: [
            musicController.music.value.isNotEmpty
                ? Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimension.padding),
                    child: Row(
                      children: [
                        Text(
                          'Songs',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SpaceBox(
                          size: 1,
                        ),
                        Text(
                          '(${musicController.music.value.resultCount ?? '0'} results)',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            musicController.music.value.isNotEmpty &&
                    musicController.music.value.results != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: musicController.music.value.resultCount,
                      itemBuilder: (BuildContext context, int index) {
                        MusicResults musicResults =
                            musicController.music.value.results![index];

                        return Obx(
                          () => MusicResult(
                            width: width,
                            musicResults: musicResults,
                            isLiked: favoriteController.favoriteList
                                .where(
                                  (favorite) =>
                                      favorite.trackId == musicResults.trackId,
                                )
                                .isNotEmpty,
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
