import 'package:flutter/material.dart';
import '../../../src/constant/app_colors.dart';
import '../../../src/constant/app_text_style.dart';

class ReusableButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ReusableButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(label, style: AppTextStyles.button),
    );
  }
}
