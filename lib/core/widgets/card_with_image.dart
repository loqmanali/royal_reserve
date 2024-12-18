import 'package:flutter/material.dart';

import '../core.dart';

class CardWithImage extends StatelessWidget {
  const CardWithImage({
    super.key,
    required this.imagePath,
    required this.title,
    this.borderRadius,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final double? borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          child: Stack(
            children: [
              // Image
              Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
              // Title
              Positioned(
                bottom: 16,
                right: 16,
                child: Text(
                  title,
                  style: AppTextStyles.bodyText.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
