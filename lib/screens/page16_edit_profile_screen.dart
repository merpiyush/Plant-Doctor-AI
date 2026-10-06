import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../resources/images.dart';
import '../resources/text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'page17_change_password_screen.dart';

/// Page 16: Edit Profile Screen
class Page16EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;

  const Page16EditProfileScreen({
    super.key,
    this.currentName = profileName,
    this.currentEmail = profileEmail,
  });

  @override
  State<Page16EditProfileScreen> createState() => _Page16EditProfileScreenState();
}

class _Page16EditProfileScreenState extends State<Page16EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleSaveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: AppColors.primary,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context, {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
      });
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
          'Edit Profile',
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

              // Avatar with camera badge
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: AppColors.primaryMint,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2.5),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          userAvatarImg,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Full Name Field
              CustomTextField(
                controller: _nameController,
                label: 'Full Name',
                hintText: 'Alex Johnson',
                prefixIcon: Icons.person_outline_rounded,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Full name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),

              // Email Field
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                hintText: 'alex.johnson@email.com',
                prefixIcon: Icons.mail_outline_rounded,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!val.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Change Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page17ChangePasswordScreen()),
                    );
                  },
                  child: const Text(
                    'Change Password',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Save Changes Button
              CustomButton(
                text: 'Save Changes',
                onPressed: _handleSaveChanges,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
