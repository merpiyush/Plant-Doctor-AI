import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'page05_verify_code_screen.dart';

/// Page 4: Forgot Password Screen
class Page04ForgotPasswordScreen extends StatefulWidget {
  const Page04ForgotPasswordScreen({super.key});

  @override
  State<Page04ForgotPasswordScreen> createState() => _Page04ForgotPasswordScreenState();
}

class _Page04ForgotPasswordScreenState extends State<Page04ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'alex.johnson@email.com');

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSendResetLink() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification code sent to your email!'),
          backgroundColor: AppColors.primary,
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to Verify Code screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Page05VerifyCodeScreen(
            email: _emailController.text.trim(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Green Hero Section with Back Button & Key Badge
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 45, bottom: 28, left: 16, right: 16),
              decoration: const BoxDecoration(
                gradient: AppColors.greenGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 10),

                  // Center Lock Badge
                  Center(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.lock_reset_rounded, color: Colors.white, size: 36),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Title & Subtitle
                  const Center(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      "No worries, we'll send you reset instructions.",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form Body
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _emailController,
                      label: 'Email',
                      hintText: 'you@example.com',
                      prefixIcon: Icons.mail_outline_rounded,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!val.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Send Reset Link Button
                    CustomButton(
                      text: 'Send Reset Link',
                      onPressed: _handleSendResetLink,
                    ),
                    const SizedBox(height: 30),

                    // Remember your password? Log In
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Remember your password? ',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
