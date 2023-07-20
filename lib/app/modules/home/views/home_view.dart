import 'package:assignment/app/core/theme/app_colors.dart';
import 'package:assignment/app/core/widgets/custom_body.dart';
import 'package:assignment/app/core/widgets/custom_button.dart';
import 'package:assignment/app/core/widgets/space_box.dart';
import 'package:assignment/app/locator.dart';
import 'package:assignment/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:assignment/app/modules/music/views/music_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomBody(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _homeTitle(context, width),
            _homeButton(),
          ],
        ),
      ),
    );
  }

  Expanded _homeTitle(BuildContext context, double width) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.music_note,
            size: width / 2,
            color: AppColors.blueColor,
          ),
          Text(
            'DigiSound',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SpaceBox(
            size: 1,
          ),
          Text(
            'Search Your Favorite Music\nAnywhere, Anytime',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  CustomButton _homeButton() {
    return CustomButton(
      text: "Get Started",
      textColor: AppColors.whiteColor,
      buttonColor: AppColors.blueColor,
      onPressed: () {
        locator.get<FavoriteController>().getFavoriteList();
        Get.to(() => const MusicView());
      },
    );
  }
}
