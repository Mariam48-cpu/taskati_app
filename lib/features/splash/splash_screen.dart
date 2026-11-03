import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/styles/app_colors.dart';
import 'package:taskati_app/core/constants/app_images.dart';
import 'package:taskati_app/core/services/local/hive_provider.dart';
import 'package:taskati_app/core/styles/app_style.dart';
import 'package:taskati_app/core/widgets/my_scaffold.dart';
import 'package:taskati_app/features/home/screens/home_screen.dart';
import 'package:taskati_app/features/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool userHasData =
      HiveProvider.getData(HiveProvider.kName) != null &&
      HiveProvider.getData(HiveProvider.kImage) != null;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (userHasData) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const UploadScreen(),
          ),
        );
      }
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
