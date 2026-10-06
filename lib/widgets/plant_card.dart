import 'package:flutter/material.dart';
import '../models/plant_model.dart';
import '../models/scan_history_model.dart';
import '../theme/app_colors.dart';
import 'status_badge.dart';

/// 2-Column Grid Card for Plant Guides Screen (Page 13)
class PlantGridCard extends StatelessWidget {
  final PlantModel plant;
  final VoidCallback onTap;

  const PlantGridCard({
    super.key,
    required this.plant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: plant.cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: plant.accentColor.withValues(alpha: 0.3), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: plant.accentColor.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top plant image / icon badge
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: plant.accentColor.withValues(alpha: 0.2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ClipOval(
                child: plant.image.isNotEmpty
                    ? Image.asset(
                        plant.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          plant.icon,
                          size: 28,
                          color: plant.accentColor,
                        ),
                      )
                    : Icon(
                        plant.icon,
                        size: 28,
                        color: plant.accentColor,
                      ),
              ),
            ),

            // Plant name and subtitle info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  plant.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Horizontal scroll card for Popular Plants on Home (Page 7)
class PopularPlantCard extends StatelessWidget {
  final PlantModel plant;
  final VoidCallback onTap;

  const PopularPlantCard({
    super.key,
    required this.plant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: plant.cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: plant.accentColor.withValues(alpha: 0.3), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: plant.image.isNotEmpty
                    ? Image.asset(
                        plant.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          plant.icon,
                          color: plant.accentColor,
                          size: 24,
                        ),
                      )
                    : Icon(plant.icon, color: plant.accentColor, size: 24),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  plant.subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// History Card for Home & Scan History Screen (Pages 7 & 18)
class ScanHistoryCard extends StatelessWidget {
  final ScanHistoryModel item;
  final VoidCallback onTap;

  const ScanHistoryCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color iconBg;
    Color iconColor;
    if (item.status.toLowerCase() == 'healthy') {
      iconBg = AppColors.healthyBg;
      iconColor = AppColors.healthyGreen;
    } else if (item.status.toLowerCase() == 'warning') {
      iconBg = AppColors.warningBg;
      iconColor = AppColors.warningOrange;
    } else {
      iconBg = AppColors.diseaseBg;
      iconColor = AppColors.diseaseRed;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: item.image.isNotEmpty
                ? Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      item.icon,
                      color: iconColor,
                      size: 24,
                    ),
                  )
                : Icon(item.icon, color: iconColor, size: 24),
          ),
        ),
        title: Text(
          item.plantName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          item.dateText,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        trailing: StatusBadge(status: item.status, isSmall: true),
      ),
    );
  }
}
