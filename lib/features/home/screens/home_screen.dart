import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/widgets/my_scaffold.dart';
import 'package:taskati_app/features/home/widgets/daily_progress.dart';
import 'package:taskati_app/features/home/widgets/home_header.dart';
import 'package:taskati_app/features/home/widgets/tasks_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          spacing: 20,
          children: [
            HomeHeader(),
            DailyProgress(progress: .6),
            DatePicker(
              height: 90,
              width: 70,
              DateTime.now().subtract(const Duration(days: 3)),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.primaryColor,
              selectedTextColor: Colors.white,
              showPastDates: true,
              onDateChange: (date) {
                // setState(() => _selectedDate = date);
              },
            ),
            TasksBuilder(currentIndex: currentIndex),
          ],
        ),
      ),
    );
  }
}
