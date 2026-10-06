import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/plant_model.dart';
import '../widgets/status_badge.dart';
import '../widgets/stat_grid.dart';
import '../widgets/custom_button.dart';
import 'page08_scan_plant_screen.dart';

/// Page 14: Plant Detail Screen
class Page14PlantDetailScreen extends StatelessWidget {
  final PlantModel plant;

  const Page14PlantDetailScreen({
    super.key,
    required this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Plant Graphic Header
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: plant.cardColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: plant.accentColor.withValues(alpha: 0.3)),
                boxShadow: [
                  BoxShadow(
                    color: plant.accentColor.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: Icon(
                      plant.icon,
                      size: 90,
                      color: plant.accentColor.withValues(alpha: 0.2),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: plant.image.isNotEmpty
                            ? Image.asset(
                                plant.image,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => Icon(
                                  plant.icon,
                                  color: plant.accentColor,
                                  size: 44,
                                ),
                              )
                            : Icon(
                                plant.icon,
                                color: plant.accentColor,
                                size: 44,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Plant Title & Status Badge Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      plant.scientificName,
                      style: const TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const StatusBadge(status: 'Easy Care'),
              ],
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              plant.description,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 20),

            // 2x2 Metric Grid
            StatGrid2x2(
              watering: plant.watering,
              sunlight: plant.sunlight,
              temperature: plant.temperature,
              humidity: plant.humidity,
            ),
            const SizedBox(height: 22),

            // Care Guide Section
            const Text(
              'Care Guide',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            _buildDetailCareRow(Icons.water_drop_outlined, 'Watering', plant.watering),
            const SizedBox(height: 8),
            _buildDetailCareRow(Icons.wb_sunny_outlined, 'Sunlight', plant.sunlight),
            const SizedBox(height: 8),
            _buildDetailCareRow(Icons.grass_outlined, 'Best Soil', plant.soil),
            const SizedBox(height: 8),
            _buildDetailCareRow(Icons.science_outlined, 'Fertilizer', plant.fertilizer),
            const SizedBox(height: 22),

            // Common Diseases
            const Text(
              'Common Diseases',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: plant.commonDiseases.map((d) => _buildDiseaseTag(d)).toList(),
            ),
            const SizedBox(height: 28),

            // Start AI Scan Button
            CustomButton(
              text: 'Start AI Scan For This Plant',
              icon: Icons.document_scanner_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page08ScanPlantScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCareRow(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.diseaseBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.diseaseRed.withValues(alpha: 0.2)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.diseaseRed,
        ),
      ),
    );
  }
}
