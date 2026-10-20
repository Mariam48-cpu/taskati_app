import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/styles/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String? title;
  final String hintText;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.onSurface,
            ),
          ),
          const Gap(8),
        ],
        TextFormField(
          controller: controller,
          maxLines: obscureText ? 1 : maxLines,
          minLines: 1,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          style: TextStyles.caption1.copyWith(color: colors.onSurface),
          cursorColor: colors.primary,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.caption1.copyWith(
              color: isDark
                  ? Colors.white54
                  : const Color.fromARGB(255, 76, 78, 80),
            ),
            prefixIcon: prefixIcon,
            prefixIconColor: isDark ? Colors.white54 : const Color(0xFF9CA3AF),
            filled: true,
            fillColor: isDark ? const Color(0xFF252525) : Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: isDark ? Colors.white12 : const Color(0xFFE5E7EB),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: colors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: colors.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: colors.error, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
