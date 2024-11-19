import 'package:flutter/material.dart';
import '../../../src/constant/app_colors.dart';
import '../../../src/constant/app_text_style.dart';

class HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const HomeMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: AppColors.cardBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(title, style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}
