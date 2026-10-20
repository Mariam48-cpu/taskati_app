import 'package:flutter/material.dart';
import 'package:taskati_app/core/constants/app_colors.dart';
import 'package:taskati_app/core/styles/app_style.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });

  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.subtitle.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
