import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_button.dart';
import 'page06_reset_password_screen.dart';

/// Page 5: Verify Code Screen
class Page05VerifyCodeScreen extends StatefulWidget {
  final String email;

  const Page05VerifyCodeScreen({
    super.key,
    this.email = 'alex.johnson@email.com',
  });

  @override
  State<Page05VerifyCodeScreen> createState() => _Page05VerifyCodeScreenState();
}

class _Page05VerifyCodeScreenState extends State<Page05VerifyCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  int _countdown = 23;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Default pre-filled sample code matching screenshot [4, 2, 7, 5]
    _controllers[0].text = '4';
    _controllers[1].text = '2';
    _controllers[2].text = '7';
    _controllers[3].text = '5';

    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _countdown = 23;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _handleVerify() {
    String otp = _controllers.map((c) => c.text).join();
    if (otp.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter all 4 digits of the code'),
          backgroundColor: AppColors.warningOrange,
        ),
      );
      return;
    }

    // Success -> Navigate to Page 6 Reset Password
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Page06ResetPasswordScreen()),
    );
  }

  void _handleResend() {
    if (_countdown == 0) {
      _startCountdown();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A new verification code has been sent!'),
          backgroundColor: AppColors.primary,
        ),
      );
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
          'Verify Code',
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
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Mail Circle Badge
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
                    Icons.mark_email_read_outlined,
                    color: AppColors.primary,
                    size: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Title and Subtitle
            const Text(
              'Enter Verification Code',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "We've sent a 4-digit code to\n${widget.email}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 32),

            // 4 OTP Boxes Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  height: 64,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: AppColors.border, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: _controllers[index].text.isNotEmpty
                              ? AppColors.primary
                              : AppColors.border,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: AppColors.primary, width: 2),
                      ),
                    ),
                    onChanged: (val) {
                      if (val.isNotEmpty && index < 3) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (val.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                      setState(() {});
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 28),

            // Countdown / Resend Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't get the code? ",
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                ),
                GestureDetector(
                  onTap: _handleResend,
                  child: Text(
                    _countdown > 0
                        ? 'Resend in 00:${_countdown.toString().padLeft(2, '0')}'
                        : 'Resend Code',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: _countdown > 0 ? AppColors.primary : AppColors.primaryDark,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Verify Button
            CustomButton(
              text: 'Verify',
              onPressed: _handleVerify,
            ),
          ],
        ),
      ),
    );
  }
}
