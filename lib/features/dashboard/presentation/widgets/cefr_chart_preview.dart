// lib/features/dashboard/presentation/widgets/cefr_chart_preview.dart
import 'package:flutter/material.dart';

class CefrChartPreview extends StatelessWidget {
  const CefrChartPreview({super.key, required this.onTap});
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
              '[Placeholder for CEFR Pie Chart]\n Current Level: B1 - Intermediate',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade500),
            )),
      ),
    );
  }
}
