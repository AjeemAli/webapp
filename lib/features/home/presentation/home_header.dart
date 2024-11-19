import 'package:flutter/material.dart';
import '../../../src/constant/app_string.dart';
import '../../../src/constant/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.greeting, style: AppTextStyles.heading),
        SizedBox(height: 8),
        Text(AppStrings.welcomeMessage, style: AppTextStyles.body),
      ],
    );
  }
}
