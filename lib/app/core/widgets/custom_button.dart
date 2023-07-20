import 'package:assignment/app/core/theme/app_dimension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(AppDimension.buttonPadding),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimension.buttonBorderRadius),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
