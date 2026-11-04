import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/constants/app_images.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/styles/app_style.dart';
import 'package:taskati_app/core/widgets/custom_text_field.dart';
import 'package:taskati_app/core/widgets/my_scaffold.dart';
import 'package:taskati_app/features/create_task/widgets/date_time_field.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String? selectedDate;
  String? selectedStartTime;
  String? selectedEndTime;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Center(
            child: SvgPicture.asset(AppImages.arrowLeftIcon, width: 30),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create Task', style: TextStyles.headline2),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: TextStyles.caption1),
            const SizedBox(height: 8),
            CustomTextField(hintText: 'Enter task title'),

            const SizedBox(height: 16),

            Text('Description', style: TextStyles.caption1),
            const SizedBox(height: 8),
            CustomTextField(hintText: 'Enter task description', maxLines: 3),

            const SizedBox(height: 24),

            DateTimeField(
              leading: AppImages.calenderIcon,
              title: 'Date',
              subtitle: selectedDate ?? DateFormat.yMd().format(DateTime.now()),
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                );
                if (date != null) {
                  setState(() {
                    selectedDate = DateFormat.yMMMEd().format(date);
                  });
                }
              },
            ),
            const Gap(16),
            DateTimeField(
              leading: AppImages.timeCircleIcon,
              title: 'Start Time',
              subtitle:
                  selectedStartTime ?? DateFormat.Hm().format(DateTime.now()),
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedStartTime = time.format(context);
                  });
                }
              },
            ),
            const Gap(16),
            DateTimeField(
              leading: AppImages.timeCircleIcon,
              title: 'End Time',
              subtitle:
                  selectedEndTime ?? DateFormat.Hm().format(DateTime.now()),
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedEndTime = time.format(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
     bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle save action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Save', style: TextStyles.subtitle),
        ),
      ),
   
    );
  }
}
