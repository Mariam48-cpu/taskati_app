import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/styles/app_style.dart';

class DailyProgress extends StatelessWidget {
  const DailyProgress({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EE, dd MMM').format(DateTime.now()),
                  style: TextStyles.body.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const Gap(10),

                Text(
                  'Your tasks almost almost done!',
                  style: TextStyles.title1.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                constraints: const BoxConstraints.tightFor(
                  width: 70,
                  height: 70,
                ),
                value: 0.6,
                strokeWidth: 5,
                strokeCap: .round,
                color: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor100,
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: TextStyles.body.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
