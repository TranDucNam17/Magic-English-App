// lib/features/onboarding/presentation/pages/onboarding_page.dart

import 'package:btlmagicenglish/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Định nghĩa màu sắc để tái sử dụng, đồng bộ với màn hình Login
    const primaryBlue = Color(0xFF007BFF);
    const backgroundColor = Color(0xFFF8FCFF); // Xanh rất nhạt
    const blackTextColor = Color(0xFF333333);
    const greyTextColor = Color(0xFF6E6E6E);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // Căn chỉnh các phần tử chính
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Hero Section (Image + Text) ---
              // Expanded để phần này chiếm không gian linh hoạt ở giữa
              const Expanded(
                child: HeroSection(
                  primaryBlue: primaryBlue,
                  blackTextColor: blackTextColor,
                  greyTextColor: greyTextColor,
                ),
              ),

              // --- Bottom Button ---
              _buildBottomButton(context, primaryBlue),
            ],
          ),
        ),
      ),
    );
  }

  // Widget cho nút bấm ở dưới cùng
  Widget _buildBottomButton(BuildContext context, Color primaryBlue) {
    return Padding(
      // Thêm padding dưới cùng để nút không dính sát viền
      padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: primaryBlue.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Navigate to Login Screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            shape: const StadiumBorder(),
            fixedSize: const Size.fromHeight(54),
          ),
          child: const Text(
            'Start',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

// Tách Hero Section ra một widget riêng cho code sạch hơn
class HeroSection extends StatelessWidget {
  final Color primaryBlue;
  final Color blackTextColor;
  final Color greyTextColor;

  const HeroSection({
    super.key,
    required this.primaryBlue,
    required this.blackTextColor,
    required this.greyTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Thêm khoảng trống ở trên cùng
        const Spacer(flex: 2),

        // Illustration Image
        Image.asset(
          'assets/images/onboarding_hero.png',
          height: MediaQuery.of(context).size.height * 0.3, // Chiều cao chiếm 30% màn hình
          // Thêm errorBuilder để xử lý nếu ảnh không load được
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.school_outlined,
              size: MediaQuery.of(context).size.height * 0.3,
              color: Colors.grey.shade300,
            );
          },
        ),

        const SizedBox(height: 40),

        // App Name
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontFamily: 'Lexend',
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(text: 'MAGIC ', style: TextStyle(color: primaryBlue)),
              TextSpan(text: 'ENGLISH', style: TextStyle(color: blackTextColor)),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Subtitle
        Text(
          'Learn English — smarter, faster, your way',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: greyTextColor,
          ),
        ),

        // Thêm khoảng trống ở dưới
        const Spacer(flex: 3),
      ],
    );
  }
}

