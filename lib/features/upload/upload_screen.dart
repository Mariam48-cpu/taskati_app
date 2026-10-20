import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/constants/app_colors.dart';
import 'package:taskati_app/core/constants/app_images.dart';
import 'package:taskati_app/core/functions/toast.dart';

import 'package:taskati_app/core/styles/app_style.dart';
import 'package:taskati_app/core/widgets/custom_main_button.dart';
import 'package:taskati_app/core/widgets/custom_text_field.dart';
import 'package:taskati_app/core/widgets/my_scaffold.dart';
import 'package:taskati_app/core/widgets/secoundry_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String imagePath = '';
  final TextEditingController controller = TextEditingController();

  Future<void> pickImage(bool isGallery) async {
    final XFile? pickedImage = await ImagePicker().pickImage(
      source: isGallery ? ImageSource.gallery : ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: Text(
          'Complete Your Profile',
          style: TextStyles.subtitle.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(40),
                    Align(
                      alignment: .centerLeft,
                      child: Text(
                        "Profile Image ",
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const Gap(16),
                    if (imagePath.isNotEmpty)
                      Stack(
                        children: [
                          ClipOval(
                            child: Image.file(
                              File(imagePath),
                              height: 180,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  imagePath = '';
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                radius: 20,
                                child: Icon(
                                  Icons.delete,
                                  color: AppColors.redColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      Image.asset(
                        AppImages.emptyUserIcon,
                        height: 180,
                        color: AppColors.greyColor,
                      ),
                    const Gap(32),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            text: 'From Gallery',
                            onPressed: () {
                              pickImage(true);
                            },
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: SecondaryButton(
                            text: 'From Camera',
                            onPressed: () {
                              pickImage(false);
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gap(32),
                    Align(
                      alignment: .centerLeft,
                      child: Text(
                        "Your Name",
                        style: TextStyles.caption1.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const Gap(16),
                    CustomTextField(
                      hintText: 'Enter your Name',
                      controller: controller,
                    ),
                    const Gap(32),
                  ],
                ),
              ),
            ),
            MainButton(
              width: .infinity,
              text: "Let’s Start !",
              onPressed: () async {
                if (imagePath.isEmpty && controller.text.isEmpty) {
                  showErrorDialog(
                    context,
                    'Please enter your name and upload an image.',
                  );
                } else if (imagePath.isNotEmpty && controller.text.isEmpty) {
                  showErrorDialog(context, 'Please enter your name.');
                } else if (imagePath.isEmpty && controller.text.isNotEmpty) {
                  showErrorDialog(context, 'Please upload an image.');
                } else {
                  final box = await Hive.openBox('Image');
                  box.put('name', controller.text);
                  box.put('image', imagePath);
                }
              },
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
