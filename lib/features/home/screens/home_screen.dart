
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/widgets/my_scaffold.dart';
import 'package:taskati_app/features/home/widgets/daily_progress.dart';
import 'package:taskati_app/features/home/widgets/home_header.dart';
import 'package:taskati_app/features/home/widgets/tasks_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const HomeHeader(),
            const Gap(16),

            const DailyProgress(progress: .6),
            const Gap(16),

            DatePicker(
              DateTime.now().subtract(
                const Duration(days: 3),
              ),
              height: 80,
              width: 65,
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.primaryColor,
              selectedTextColor: Colors.white,
              showPastDates: true,
              onDateChange: (date) {},
            ),

            const Gap(12),

            const Expanded(
              child: TasksBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
