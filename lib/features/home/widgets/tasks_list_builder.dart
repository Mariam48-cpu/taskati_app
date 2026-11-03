import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/features/home/widgets/task_card.dart';

class TasksListBuilder extends StatelessWidget {
  const TasksListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => TaskCard(),
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: 3,
    );
  }
}
