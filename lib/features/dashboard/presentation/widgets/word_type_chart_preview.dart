// lib/features/dashboard/presentation/widgets/word_type_chart_preview.dart
import 'package:flutter/material.dart';

class WordTypeChartPreview extends StatelessWidget {
  const WordTypeChartPreview({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Center(
          child: Text(
            '[Placeholder for Word-type Bar Chart]',
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      ),
    );
  }
}
