import 'package:currency/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(blurRadius: 2, color: DefaultSelectionStyle.defaultColor),
        ],
        color: AppColors.white,
      ),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
