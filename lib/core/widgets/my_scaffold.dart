import 'package:flutter/material.dart';
import 'package:taskati_app/core/constants/app_images.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.padding,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.backgroundImage, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding:
                  padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: body,
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
