import 'package:flutter/material.dart';
import '../widgets/login_form.dart'; // Import widget con
import 'package:btlmagicenglish/features/auth/presentation/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  //điều hướng
  void _onRegisterPressed(BuildContext context) {
    // Logic để chuyển sang màn hình Register
    // dùng 'push' để mở màn hình Register lên trên màn hình Login
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. App Name/Logo
              Text(
                'Magic English',
                style: textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF2E7D32), // Magic English Green
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend',
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome back! Sign in to continue.',
                style: textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 48),

              // 2. Login Form (Tách widget)
              const LoginForm(),

              const Spacer(), // Đẩy phần footer xuống dưới cùng

              // 3. Register Link
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: () => _onRegisterPressed(context),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: const Color(0xFF2E7D32), // Magic English Green
                          fontWeight: FontWeight.bold,
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
    );
  }
}
