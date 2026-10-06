import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Clean status pill badge (Healthy, Warning, Disease, Easy Care)
class StatusBadge extends StatelessWidget {
  final String status;
  final bool isSmall;

  const StatusBadge({
    super.key,
    required this.status,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    IconData icon;

    switch (status.toLowerCase()) {
      case 'healthy':
        bgColor = AppColors.healthyBg;
        textColor = AppColors.healthyGreen;
        icon = Icons.check_circle_rounded;
        break;
      case 'warning':
        bgColor = AppColors.warningBg;
        textColor = AppColors.warningOrange;
        icon = Icons.warning_amber_rounded;
        break;
      case 'disease':
        bgColor = AppColors.diseaseBg;
        textColor = AppColors.diseaseRed;
        icon = Icons.error_rounded;
        break;
      case 'easy care':
      default:
        bgColor = AppColors.primaryMint;
        textColor = AppColors.primary;
        icon = Icons.spa_rounded;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : 12,
        vertical: isSmall ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isSmall ? 12 : 14, color: textColor),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: isSmall ? 11 : 12,
            ),
          ),
        ],
      ),
    );
  }
}
