import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/styles/app_style.dart';
import 'package:taskati_app/features/home/widgets/custom_tab.dart';
import 'package:taskati_app/features/home/widgets/tasks_list_builder.dart';

class TasksBuilder extends StatefulWidget {
  const new({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<TasksBuilder> createState() => _TasksBuilderState();
}

class _TasksBuilderState extends State<TasksBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
              horizontal: 8,
              vertical: 0,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.greyColor,
            labelStyle: TextStyles.subtitle,
            unselectedLabelStyle: TextStyles.subtitle,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(0),
            indicatorWeight: 0,
            onTap: (index) {},
            tabs: [
              Tab(
                child: CustomTab(widget: widget, text: 'All'),
              ),
              Tab(
                child: CustomTab(widget: widget, text: 'Completed'),
              ),
              Tab(
                child: CustomTab(widget: widget, text: 'Pending'),
              ),
            ],
          ),
          const Gap(20),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TasksListBuilder(),
                TasksListBuilder(),
                TasksListBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
