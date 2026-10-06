import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../resources/text.dart';
import '../data/plant_data.dart';

/// Page 19: Help & Support Screen
class Page19HelpSupportScreen extends StatelessWidget {
  const Page19HelpSupportScreen({super.key});

  void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
          helpSupportTitle,
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
            // 3 Quick Action Cards
            Row(
              children: [
                _buildQuickAction(
                  context,
                  icon: Icons.support_agent_rounded,
                  label: 'Contact\nSupport',
                  onTap: () => _showFeedback(context, 'Opening Support Chat...'),
                ),
                const SizedBox(width: 10),
                _buildQuickAction(
                  context,
                  icon: Icons.bug_report_outlined,
                  label: 'Report\na Bug',
                  onTap: () => _showFeedback(context, 'Bug Report Form opened.'),
                ),
                const SizedBox(width: 10),
                _buildQuickAction(
                  context,
                  icon: Icons.rate_review_outlined,
                  label: 'Send\nFeedback',
                  onTap: () => _showFeedback(context, 'Feedback form opened.'),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // FAQs Section Title
            const Text(
              'FAQs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            // Expandable Accordions for FAQs
            ...PlantData.faqs.map((faq) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    iconColor: AppColors.primary,
                    collapsedIconColor: AppColors.textMuted,
                    title: Text(
                      faq['question']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
                        child: Text(
                          faq['answer']!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),

            // Contact Us Section
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryMint,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.email_outlined, color: AppColors.primary, size: 22),
                    ),
                    title: const Text(
                      supportEmail,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    subtitle: const Text(
                      'Replies within 24 hours',
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                    onTap: () => _showFeedback(context, 'Email: $supportEmail'),
                  ),
                  const Divider(color: AppColors.border),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryMint,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.phone_outlined, color: AppColors.primary, size: 22),
                    ),
                    title: const Text(
                      supportPhone,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    subtitle: const Text(
                      'Mon-Fri, 9am - 6pm EST',
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                    onTap: () => _showFeedback(context, 'Calling $supportPhone...'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryMint,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primary, size: 22),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
