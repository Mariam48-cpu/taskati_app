
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/styles/app_style.dart';
import 'package:taskati_app/features/home/widgets/tasks_list_builder.dart';

class TasksBuilder extends StatelessWidget {
  const TasksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          dividerHeight: 0,
          indicator: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 4,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.greyColor,
          labelStyle: TextStyles.subtitle,
          unselectedLabelStyle: TextStyles.subtitle,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Completed'),
            Tab(text: 'Pending'),
          ],
        ),

        const Gap(12),

        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              TasksListBuilder(),
              TasksListBuilder(),
              TasksListBuilder(),
            ],
          ),
        ),
      ],
    );
  }
}
