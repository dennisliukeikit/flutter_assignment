import 'package:assignment/app/core/theme/app_colors.dart';
import 'package:assignment/app/core/theme/app_dimension.dart';
import 'package:assignment/app/core/widgets/space_box.dart';
import 'package:assignment/app/data/models/music_model.dart';
import 'package:assignment/app/modules/detail/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicResult extends StatelessWidget {
  final double width;
  final MusicResults musicResults;
  final bool isLiked;
  const MusicResult({
    super.key,
    required this.width,
    required this.musicResults,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const DetailView(), arguments: musicResults);
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.all(AppDimension.padding),
        margin: const EdgeInsets.only(bottom: AppDimension.margin),
        decoration: BoxDecoration(
          color: isLiked ? AppColors.blueColor : AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimension.borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(AppDimension.borderRadius)),
                child: Image.network('${musicResults.artworkUrl100}'),
              ),
            ),
            const SpaceBox(
              size: 1,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    musicResults.trackName ?? "",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isLiked
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                  ),
                  const SpaceBox(
                    size: 1,
                  ),
                  Text(
                    musicResults.artistName ?? "",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isLiked
                              ? AppColors.lightBlueColor
                              : AppColors.lightGreyColor,
                        ),
                  ),
                ],
              ),
            ),
            const SpaceBox(
              size: 1,
            ),
            Icon(
              Icons.more_horiz_rounded,
              color: isLiked ? AppColors.whiteColor : AppColors.blackColor,
            )
          ],
        ),
      ),
    );
  }
}
