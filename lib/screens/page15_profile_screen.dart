import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../resources/images.dart';
import '../resources/text.dart';
import 'page16_edit_profile_screen.dart';
import 'page18_scan_history_screen.dart';
import 'page19_help_support_screen.dart';
import 'page03_login_screen.dart';

/// Page 15: Profile Screen
class Page15ProfileScreen extends StatefulWidget {
  final bool isTabScreen;

  const Page15ProfileScreen({
    super.key,
    this.isTabScreen = false,
  });

  @override
  State<Page15ProfileScreen> createState() => _Page15ProfileScreenState();
}

class _Page15ProfileScreenState extends State<Page15ProfileScreen> {
  String _userName = profileName;
  String _userEmail = profileEmail;

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Are you sure you want to log out of Plant Doctor AI?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Page03LoginScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.diseaseRed,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Avatar Circle using userAvatarImg
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  color: AppColors.primaryMint,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    userAvatarImg,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Name & Email
              Text(
                _userName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _userEmail,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 22),

              // 3 Statistics Cards
              Row(
                children: [
                  _buildStatBox('24', 'Plants\nScanned', AppColors.primary),
                  const SizedBox(width: 10),
                  _buildStatBox('18', 'Healthy\nPlants', AppColors.healthyGreen),
                  const SizedBox(width: 10),
                  _buildStatBox('6', 'Treated\nDiseases', AppColors.warningOrange),
                ],
              ),
              const SizedBox(height: 24),

              // Profile Menu Section
              Container(
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
                  children: [
                    _buildMenuItem(
                      icon: Icons.person_outline_rounded,
                      title: 'Edit Profile',
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Page16EditProfileScreen(
                              currentName: _userName,
                              currentEmail: _userEmail,
                            ),
                          ),
                        );
                        if (result != null && result is Map<String, String>) {
                          setState(() {
                            _userName = result['name'] ?? _userName;
                            _userEmail = result['email'] ?? _userEmail;
                          });
                        }
                      },
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16, color: AppColors.border),
                    _buildMenuItem(
                      icon: Icons.history_rounded,
                      title: 'Scan History',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page18ScanHistoryScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16, color: AppColors.border),
                    _buildMenuItem(
                      icon: Icons.help_outline_rounded,
                      title: 'Help & Support',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page19HelpSupportScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16, color: AppColors.border),
                    _buildMenuItem(
                      icon: Icons.logout_rounded,
                      title: 'Log Out',
                      titleColor: AppColors.diseaseRed,
                      iconColor: AppColors.diseaseRed,
                      onTap: _showLogoutDialog,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(String count, String label, Color color) {
    return Expanded(
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
            Text(
              count,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color titleColor = AppColors.textPrimary,
    Color iconColor = AppColors.primary,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textMuted,
        size: 22,
      ),
    );
  }
}
