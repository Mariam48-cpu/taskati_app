import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    name = HiveProvider.getData(HiveProvider.kName) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (image.isNotEmpty)
          ClipOval(
            child: Image.file(
              File(image),
              height: 50,
              width: 50,
              fit: BoxFit.cover,
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
