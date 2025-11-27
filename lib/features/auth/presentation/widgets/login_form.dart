import 'package:btlmagicenglish/features/auth/presentation/pages/forgot_password_email_page.dart';
import 'package:flutter/material.dart';
import 'package:btlmagicenglish/features/dashboard/presentation/pages/dashboard_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    // Validate form
    if (_formKey.currentState?.validate() ?? false) {
      // Logic đăng nhập
      // logic gọi API đăng nhập ở đây trong tương lai
      // nếu API trả về thành công, thực hiẹ dều hướng
      print('Login successful. Navigation to Dashboard...');

      // Dùng pushReplacement để thay thế trang Login bằng trang Dashboard.
      // Người dùng không thể quay lại trang Login bằng nút Back.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const DashboardPage(),
        ),
      );
    }else{
      // Nếu form không hợp lệ, SnackBar sẽ thông báo (do validator của TextFormField)
      print('Login failed: Form is not valid.');
    }
  }

  void _onForgotPasswordPressed() {
    // Logic chuyển tới màn hình Forgot Password
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordEmailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade600),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Forgot Password Link
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: _onForgotPasswordPressed,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: const Color(0xFF2E7D32), // Magic English Green
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          const SizedBox(height: 24),

          // Login Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _onLoginPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32), // Magic English Green
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
