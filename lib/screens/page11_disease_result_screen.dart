import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../resources/images.dart';
import '../widgets/status_badge.dart';
import '../widgets/stat_grid.dart';
import '../widgets/custom_button.dart';
import 'page12_care_guide_screen.dart';
import 'page08_scan_plant_screen.dart';

/// Page 11: Disease Result Screen
class Page11DiseaseResultScreen extends StatelessWidget {
  final String plantName;
  final String diseaseName;
  final int confidence;

  const Page11DiseaseResultScreen({
    super.key,
    this.plantName = 'Rose',
    this.diseaseName = 'Black Spot (Diplocarpon rosae)',
    this.confidence = 84,
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
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.textPrimary),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Sharing diagnosis report...'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plant Graphic Card (Coral/Rose Tinted Background with diseased rose image)
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE57373), Color(0xFFEF5350)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.diseaseRed.withValues(alpha: 0.25),
                    blurRadius: 12,
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
                      Icons.bug_report_outlined,
                      size: 90,
                      color: Colors.white.withValues(alpha: 0.18),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              diseaseRoseImg,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(
                                Icons.local_florist_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Plant Name & Disease Badge Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plantName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Text(
                      'Rosa rubiginosa',
                      style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const StatusBadge(status: 'Disease'),
              ],
            ),
            const SizedBox(height: 12),

            // Confidence Alert Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.diseaseBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.diseaseRed.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_rounded, size: 18, color: AppColors.diseaseRed),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '$confidence% Confidence — $diseaseName detected',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.diseaseRed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Big Disease Details Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diseaseName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.diseaseRed,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Symptom Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      _buildTag('Black leaf spots'),
                      _buildTag('Yellowing edges'),
                      _buildTag('Leaf drop'),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Description
                  const Text(
                    'A common fungal disease that causes circular dark spots on upper leaves, followed by yellowing and premature leaf defoliation.',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),

                  const Divider(color: AppColors.border),
                  const SizedBox(height: 10),

                  // Recommended Treatments
                  const Text(
                    'Recommended Treatment:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTreatmentPoint('Reduce overhead watering to keep foliage dry.'),
                  _buildTreatmentPoint('Remove and dispose of infected leaves.'),
                  _buildTreatmentPoint('Apply organic neem oil spray once weekly.'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Adjusted 2x2 Metric Grid
            const StatGrid2x2(
              watering: 'Every 3 Days',
              sunlight: '6 Hours',
              temperature: '18-24°C',
              humidity: '50%',
            ),
            const SizedBox(height: 28),

            // Action Buttons Row
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    text: 'View Care Guide',
                    borderColor: AppColors.diseaseRed,
                    textColor: AppColors.diseaseRed,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page12CareGuideScreen(plantName: 'Rose'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: 'Scan Again',
                    backgroundColor: AppColors.diseaseRed,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page08ScanPlantScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.diseaseBg,
        borderRadius: BorderRadius.circular(12),
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

  Widget _buildTreatmentPoint(String point) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, size: 16, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              point,
              style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
