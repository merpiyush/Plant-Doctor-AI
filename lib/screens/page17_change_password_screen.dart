import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Page 17: Change Password Screen
class Page17ChangePasswordScreen extends StatefulWidget {
  const Page17ChangePasswordScreen({super.key});

  @override
  State<Page17ChangePasswordScreen> createState() => _Page17ChangePasswordScreenState();
}

class _Page17ChangePasswordScreenState extends State<Page17ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleUpdatePassword() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_newPasswordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('New passwords do not match!'),
            backgroundColor: AppColors.diseaseRed,
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password updated successfully!'),
          backgroundColor: AppColors.primary,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context);
    }
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
          'Change Password',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Shield Badge
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primaryMint,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary.withValues(alpha: 0.3), width: 1.5),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.lock_person_outlined,
                      color: AppColors.primary,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Update Your Password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Choose a strong password you haven't used before.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 28),

              // Current Password Field
              CustomTextField(
                controller: _currentPasswordController,
                label: 'Current Password',
                hintText: '••••••••',
                prefixIcon: Icons.lock_outline_rounded,
                obscureText: _obscureCurrent,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureCurrent ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureCurrent = !_obscureCurrent;
                    });
                  },
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter current password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // New Password Field
              CustomTextField(
                controller: _newPasswordController,
                label: 'New Password',
                hintText: '••••••••',
                prefixIcon: Icons.lock_outline_rounded,
                obscureText: _obscureNew,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNew ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureNew = !_obscureNew;
                    });
                  },
                ),
                validator: (val) {
                  if (val == null || val.length < 6) {
                    return 'New password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Confirm New Password Field
              CustomTextField(
                controller: _confirmPasswordController,
                label: 'Confirm New Password',
                hintText: '••••••••',
                prefixIcon: Icons.lock_outline_rounded,
                obscureText: _obscureConfirm,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirm = !_obscureConfirm;
                    });
                  },
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please confirm new password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Update Password Button
              CustomButton(
                text: 'Update Password',
                onPressed: _handleUpdatePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
