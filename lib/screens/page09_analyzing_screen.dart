import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'page10_healthy_result_screen.dart';
import 'page11_disease_result_screen.dart';

/// Page 9: Analyzing Screen (Dark Green Theme)
class Page09AnalyzingScreen extends StatefulWidget {
  final bool simulateDisease;

  const Page09AnalyzingScreen({
    super.key,
    this.simulateDisease = false,
  });

  @override
  State<Page09AnalyzingScreen> createState() => _Page09AnalyzingScreenState();
}

class _Page09AnalyzingScreenState extends State<Page09AnalyzingScreen> {
  int _progress = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnalysisSimulation();
  }

  void _startAnalysisSimulation() {
    // Increment progress from 0% to 100% over ~3 seconds
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_progress < 100) {
        setState(() {
          _progress++;
        });
      } else {
        timer.cancel();
        _navigateToResult();
      }
    });
  }

  void _navigateToResult() {
    if (!mounted) return;
    if (widget.simulateDisease) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Page11DiseaseResultScreen(
            plantName: 'Rose',
            diseaseName: 'Black Spot (Diplocarpon rosae)',
            confidence: 84,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Page10HealthyResultScreen(
            plantName: 'Rose',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Analyzing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          // Demo toggle between healthy and disease result
          IconButton(
            tooltip: 'Simulate Disease Result',
            icon: Icon(
              widget.simulateDisease ? Icons.bug_report : Icons.health_and_safety_outlined,
              color: Colors.white.withValues(alpha: 0.7),
            ),
            onPressed: () {
              _timer?.cancel();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Page09AnalyzingScreen(simulateDisease: !widget.simulateDisease),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: Column(
          children: [
            const Spacer(),

            // Circular Progress Indicator with Percentage
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: _progress / 100.0,
                    strokeWidth: 8,
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00E676)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$_progress%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Analyzing',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),

            // Analysis Steps Checklist
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Column(
                children: [
                  _buildStepItem('Detecting Species', _progress >= 25, _progress < 25),
                  const SizedBox(height: 14),
                  _buildStepItem('Checking Plant Health', _progress >= 50, _progress >= 25 && _progress < 50),
                  const SizedBox(height: 14),
                  _buildStepItem('Analyzing Leaf Texture', _progress >= 75, _progress >= 50 && _progress < 75),
                  const SizedBox(height: 14),
                  _buildStepItem('Calculating Confidence', _progress >= 95, _progress >= 75 && _progress < 95),
                ],
              ),
            ),

            const Spacer(),

            // Footer info
            Text(
              'Analyzing your plant... Back cancels the scan',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem(String title, bool isDone, bool isInProgress) {
    return Row(
      children: [
        if (isDone)
          const Icon(Icons.check_circle_rounded, color: Color(0xFF00E676), size: 20)
        else if (isInProgress)
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
            ),
          )
        else
          Icon(Icons.radio_button_unchecked, color: Colors.white.withValues(alpha: 0.3), size: 20),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: isDone || isInProgress ? Colors.white : Colors.white.withValues(alpha: 0.4),
              fontSize: 14,
              fontWeight: isDone || isInProgress ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
