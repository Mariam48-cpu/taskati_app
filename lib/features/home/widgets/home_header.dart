import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/constants/app_images.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/services/local/hive_provider.dart';
import 'package:taskati_app/core/styles/app_style.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String image = '';
  String name = '';

  @override
  void initState() {
    super.initState();
    image = HiveProvider.getData(HiveProvider.kImage) ?? '';
    name = HiveProvider.getData(HiveProvider.kName) ?? 'user';
  }

  @override
  Widget build(BuildContext context) {
    final imageFile = image.isNotEmpty ? File(image) : null;

    return Row(
      children: [
        ClipOval(
          child: SizedBox(
            height: 50,
            width: 50,
            child: imageFile != null && imageFile.existsSync()
                ? ClipOval(
                    child: Image.file(
                      File(image),
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipOval(
                    child: Image.asset(
                      AppImages.emptyUserIcon,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,', style: TextStyles.caption1),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.subtitle.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
