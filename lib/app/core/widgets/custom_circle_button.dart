import 'package:assignment/app/core/theme/app_dimension.dart';
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color buttonColor;
  final VoidCallback onPressed;
  const CustomCircleButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(AppDimension.circleButtonPadding),
        backgroundColor: buttonColor,
        shape: const CircleBorder(),
      ),
      child: Center(
          child: Icon(
        icon,
        color: iconColor,
        size: AppDimension.logoSize,
      )),
    );
  }
}
