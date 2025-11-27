import 'package:flutter/material.dart';

class OnboardingSlideContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingSlideContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration Placeholder
          Expanded(
            child: AspectRatio(
              aspectRatio: 1, // Giữ hình ảnh vuông vức
              child: Container(
                //alignment: Alignment.center,
                // Tạm thời dùng icon thay cho ảnh
                //child: Image.asset(imagePath, fit: BoxFit.contain), // Bỏ comment khi có ảnh
                child: Icon(
                  Icons.school, // Placeholder icon
                  size: 150,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black, // Sửa thành Colors.black
            ),
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
