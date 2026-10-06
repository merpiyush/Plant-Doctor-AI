import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';

/// Page 12: Care Guide Screen
class Page12CareGuideScreen extends StatelessWidget {
  final String plantName;

  const Page12CareGuideScreen({
    super.key,
    this.plantName = 'Rose',
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
        title: const Text(
          'Care Guide',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Subtitle
            Text(
              '$plantName Care Guide',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Everything your $plantName needs to thrive.',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),

            // 4 Care Cards
            _buildCareCard(
              icon: Icons.water_drop_outlined,
              iconColor: const Color(0xFF1E88E5),
              title: 'Watering',
              subtitle: 'Every 2-3 Days',
              description: 'Water deeply at the base early morning. Avoid wetting leaves directly.',
            ),
            const SizedBox(height: 12),

            _buildCareCard(
              icon: Icons.wb_sunny_outlined,
              iconColor: const Color(0xFFF57C00),
              title: 'Sunlight',
              subtitle: '6-8 Hours',
              description: 'Thrives in direct sunlight. Provide light shade in scorching afternoons.',
            ),
            const SizedBox(height: 12),

            _buildCareCard(
              icon: Icons.grass_outlined,
              iconColor: const Color(0xFF43A047),
              title: 'Best Soil',
              subtitle: 'Well-drained',
              description: 'Loamy, nutrient-rich soil with pH between 6.0 and 6.5.',
            ),
            const SizedBox(height: 12),

            _buildCareCard(
              icon: Icons.science_outlined,
              iconColor: const Color(0xFF8E24AA),
              title: 'Fertilizer',
              subtitle: 'Monthly',
              description: 'Feed with balanced rose organic fertilizer during spring and summer.',
            ),
            const SizedBox(height: 22),

            // Common Diseases Section
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
              children: [
                _buildDiseaseChip('Black Spot'),
                _buildDiseaseChip('Powdery Mildew'),
                _buildDiseaseChip('Rust'),
              ],
            ),
            const SizedBox(height: 22),

            // Expert Tips Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryMint.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.lightbulb_outline, color: AppColors.primary, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Expert Tips',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildBullet('Do not overwater or allow roots to sit in stagnant water.'),
                  _buildBullet('Ensure adequate spacing between plants for airflow.'),
                  _buildBullet('Prune spent blossoms and dead stems regularly.'),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Done Button
            CustomButton(
              text: 'Done',
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildCareCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.diseaseBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.diseaseRed.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.diseaseRed,
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}
