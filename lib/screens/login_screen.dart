import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signup_screen.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
  String? _emailError;
  String? _passwordError;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    setState(() {
      _emailError = null;
      _passwordError = null;

      if (!email.endsWith('@gmail.com')) {
        _emailError = 'Email must end with @gmail.com';
      }

      if (password.length < 8 ||
          !RegExp(r'[A-Z]').hasMatch(password) ||
          !RegExp(r'[a-z]').hasMatch(password) ||
          !RegExp(r'[0-9]').hasMatch(password) ||
          !RegExp(r'[!@#\$&*~]').hasMatch(password)) {
        _passwordError =
        'Password must be 8+ chars with A-Z, a-z, 0-9, and a symbol';
      }

      if (_emailError == null && _passwordError == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),

              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 30.h),

              // Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  if (_emailError != null)
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        _emailError!,
                        style:
                        TextStyle(color: Colors.redAccent, fontSize: 12.sp),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 20.h),

              // Password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                      suffixIcon: Checkbox(
                        value: !_obscurePassword,
                        onChanged: (value) {
                          setState(() {
                            _obscurePassword = !(value ?? false);
                          });
                        },
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  if (_passwordError != null)
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        _passwordError!,
                        style:
                        TextStyle(color: Colors.redAccent, fontSize: 12.sp),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 10.h),

              // Remember me + Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // Login Button
              GestureDetector(
                onTap: _login,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login, color: Colors.white, size: 28.w),
                      SizedBox(width: 10.w),
                      Text(
                        'Login',
                        style:
                        TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              Text(
                'OR',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 25.h),

              // Google Login
              GestureDetector(
                onTap: () {
                  // Google login logic
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_mobiledata,
                          color: Colors.white, size: 28.w),
                      SizedBox(width: 10.w),
                      Text(
                        'Google',
                        style:
                        TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // Signup Navigation
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: 'Create an account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
