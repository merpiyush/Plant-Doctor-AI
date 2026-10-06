import 'package:flutter/material.dart';

/// Simple model representing a Scan History entry
class ScanHistoryModel {
  final String id;
  final String plantName;
  final String dateText;
  final String status; // 'Healthy', 'Warning', 'Disease'
  final String diseaseName;
  final int confidence;
  final IconData icon;
  final String image; // Asset image path from images.dart

  const ScanHistoryModel({
    required this.id,
    required this.plantName,
    required this.dateText,
    required this.status,
    this.diseaseName = '',
    this.confidence = 95,
    this.icon = Icons.eco,
    this.image = '',
  });
}
