import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/constants/app_colors.dart';
import 'package:taskati_app/core/constants/app_images.dart';
import 'package:taskati_app/core/styles/app_style.dart';
import 'package:taskati_app/core/widgets/my_scaffold.dart';
import 'package:taskati_app/features/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UploadScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.logoLottie, width: 250, height: 250),
            Gap(16),
            Text(
              'Taskati',
              style: TextStyles.title1.copyWith(fontWeight: FontWeight.bold),
            ),
            Gap(8),
            Text(
              'It’s time to get organized',
              style: TextStyles.body.copyWith(
                color: AppColors.greyColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
