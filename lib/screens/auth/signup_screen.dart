import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_screen.dart';
import '../dashboard/dashboard_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Start your wellness journey today.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
              ),
              SizedBox(height: 40.h),

              // Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: 'Full Name',
                ),
                validator: (value) => (value == null || value.isEmpty) ? 'Name is required' : null,
              ),
              SizedBox(height: 20.h),

              // Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Email Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email is required';
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return 'Invalid email';
                  return null;
                },
              ),
              SizedBox(height: 20.h),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) => (value == null || value.length < 6) ? 'Password must be 6+ characters' : null,
              ),
              
              SizedBox(height: 40.h),

              // Sign Up Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? Colors.grey.shade900 : Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 55.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                  elevation: 0,
                ),
                child: Text('Sign Up', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),

              SizedBox(height: 30.h),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: isDark ? Colors.white70 : Colors.black54, fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.blue.shade700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
