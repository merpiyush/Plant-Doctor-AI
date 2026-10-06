import 'package:flutter/material.dart';

/// Simple model representing a Plant in Plant Doctor AI
class PlantModel {
  final String id;
  final String name;
  final String scientificName;
  final String category; // 'Indoor', 'Flowering', 'Succulents'
  final String subtitle;
  final String description;
  final String watering;
  final String sunlight;
  final String temperature;
  final String humidity;
  final String soil;
  final String fertilizer;
  final List<String> commonDiseases;
  final List<String> expertTips;
  final Color cardColor;
  final Color accentColor;
  final IconData icon;
  final String image; // Asset image path from images.dart

  const PlantModel({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.category,
    required this.subtitle,
    required this.description,
    required this.watering,
    required this.sunlight,
    required this.temperature,
    required this.humidity,
    required this.soil,
    required this.fertilizer,
    required this.commonDiseases,
    required this.expertTips,
    required this.cardColor,
    required this.accentColor,
    this.icon = Icons.eco,
    this.image = '',
  });
}
