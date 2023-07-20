import 'package:assignment/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_dimension.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.music_note,
      size: AppDimension.logoSize,
      color: AppColors.blueColor,
    )
        .animate(
          onPlay: ((controller) => controller.repeat(reverse: true)),
        )
        .scaleXY(
          begin: 1,
          end: 1.2,
          duration: const Duration(
            milliseconds: 800,
          ),
        )
        .shake(
          duration: const Duration(
            milliseconds: 800,
          ),
        );
  }
}
