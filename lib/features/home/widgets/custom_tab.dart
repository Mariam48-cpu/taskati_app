import 'package:flutter/material.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/styles/app_style.dart';
import 'package:taskati_app/features/home/widgets/tasks_builder.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.widget, required this.text});

  final TasksBuilder widget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.currentIndex == 1
            ? AppColors.primaryColor
            : AppColors.secondaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyles.body.copyWith(
            color: widget.currentIndex == 1
                ? AppColors.whiteColor
                : AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
