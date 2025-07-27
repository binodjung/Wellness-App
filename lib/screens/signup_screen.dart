import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';

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
  bool _rememberMe = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform login logic here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Back
                Container(
                  alignment: Alignment.centerLeft, //sets text alignment
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    'Start your wellness\n journey today.',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Name field
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                // Email field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Enter your email',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Enter your password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),

                // Remember Me
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
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Login Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: GestureDetector(
                    onTap: _submitForm,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login, size: 28.w, color: Colors.white),
                        SizedBox(width: 10.w),
                        Text(
                          'SignUp',
                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                // OR
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 25.h),

                // Google button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Google login
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.g_mobiledata, size: 28.w, color: Colors.white),
                        SizedBox(width: 10.w),
                        Text(
                          'Google',
                          style: TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                // Bottom text: Create account
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
