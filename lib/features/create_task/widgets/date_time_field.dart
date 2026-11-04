import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskati_app/core/constants/app_images.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/styles/app_style.dart';

class DateTimeField extends StatelessWidget {
  const DateTimeField({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String leading;
  final String title;
  final String subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor,
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        tileColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: SvgPicture.asset(leading),
        title: Text(
          title,
          style: TextStyles.caption2.copyWith(color: AppColors.greyColor),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyles.body.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
        trailing: SvgPicture.asset(AppImages.arrowDownIcon),
        onTap: onTap,
      ),
    );
  }
}
