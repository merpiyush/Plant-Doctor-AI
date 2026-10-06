import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'page09_analyzing_screen.dart';

/// Page 8: Scan Plant Screen
class Page08ScanPlantScreen extends StatelessWidget {
  final bool isTabScreen;

  const Page08ScanPlantScreen({
    super.key,
    this.isTabScreen = false,
  });

  void _startScanning(BuildContext context, String source) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected image from $source. Analyzing with AI...'),
        backgroundColor: AppColors.primary,
        duration: const Duration(milliseconds: 1500),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Page09AnalyzingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: isTabScreen
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
        title: const Text(
          'Scan Plant',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            const Text(
              'Scan Your Plant',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Take a clear picture of the leaves.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 28),

            // Large Scanning Viewfinder Area
            Center(
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: AppColors.primaryMint.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryLight.withValues(alpha: 0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.08),
                      blurRadius: 16,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer bracket guide corners
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.primary, width: 3),
                            left: BorderSide(color: AppColors.primary, width: 3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 30,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: AppColors.primary, width: 3),
                            right: BorderSide(color: AppColors.primary, width: 3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 30,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColors.primary, width: 3),
                            left: BorderSide(color: AppColors.primary, width: 3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 30,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColors.primary, width: 3),
                            right: BorderSide(color: AppColors.primary, width: 3),
                          ),
                        ),
                      ),
                    ),

                    // Central Leaf Icon
                    Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.eco,
                          size: 48,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Camera and Gallery Buttons Row
            Row(
              children: [
                // Camera Button (Filled Green)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _startScanning(context, 'Camera'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 2,
                    ),
                    icon: const Icon(Icons.camera_alt_rounded, size: 20),
                    label: const Text(
                      'Camera',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Gallery Button (Outlined White)
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _startScanning(context, 'Gallery'),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: AppColors.border, width: 1.5),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.photo_library_outlined, size: 20),
                    label: const Text(
                      'Gallery',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Tips for Best Results Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tips for best results',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTipItem(Icons.wb_sunny_outlined, 'Good lighting: Ensure bright, even lighting'),
                  const SizedBox(height: 8),
                  _buildTipItem(Icons.center_focus_strong_outlined, 'Focus on leaves: Get close to the affected area'),
                  const SizedBox(height: 8),
                  _buildTipItem(Icons.wb_twilight_outlined, 'Avoid shadows: Keep background clear and simple'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
