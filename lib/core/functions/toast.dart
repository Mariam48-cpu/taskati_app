import 'package:flutter/material.dart';
import 'package:taskati_app/core/constants/app_colors.dart';

void showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 238, 100, 133),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 60),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
    ),
  );
}

void showSuccessDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.lightgreen,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 60),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
    ),
  );
}
