import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/scan_history_model.dart';
import '../data/plant_data.dart';
import '../widgets/plant_card.dart';
import 'page10_healthy_result_screen.dart';
import 'page11_disease_result_screen.dart';

/// Page 18: Scan History Screen
class Page18ScanHistoryScreen extends StatefulWidget {
  const Page18ScanHistoryScreen({super.key});

  @override
  State<Page18ScanHistoryScreen> createState() => _Page18ScanHistoryScreenState();
}

class _Page18ScanHistoryScreenState extends State<Page18ScanHistoryScreen> {
  String _selectedFilter = 'All';

  List<ScanHistoryModel> get _filteredHistory {
    if (_selectedFilter == 'All') {
      return PlantData.scanHistory;
    }
    return PlantData.scanHistory
        .where((item) => item.status.toLowerCase() == _selectedFilter.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = _filteredHistory;

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
          'Scan History',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Chips Row
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: PlantData.historyFilters.length,
              itemBuilder: (context, index) {
                final filter = PlantData.historyFilters[index];
                final isSelected = _selectedFilter == filter;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    selectedColor: AppColors.primary,
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textSecondary,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      fontSize: 13,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? AppColors.primary : AppColors.border,
                      ),
                    ),
                    showCheckmark: false,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Total Count Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '${list.length} scans found',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // List of History Items
          Expanded(
            child: list.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.history_toggle_off_rounded, size: 48, color: AppColors.textMuted),
                        SizedBox(height: 12),
                        Text(
                          'No scans found for this category',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return ScanHistoryCard(
                        item: item,
                        onTap: () {
                          if (item.status.toLowerCase() == 'healthy') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Page10HealthyResultScreen(
                                  plantName: item.plantName,
                                  confidence: item.confidence,
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Page11DiseaseResultScreen(
                                  plantName: item.plantName,
                                  diseaseName: item.diseaseName.isNotEmpty
                                      ? item.diseaseName
                                      : 'Black Spot (Diplocarpon rosae)',
                                  confidence: item.confidence,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
