import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'verification_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Forgot Password?",
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Enter your email address and we'll send you a 4-digit code to reset your password.",
              style: TextStyle(
                fontSize: 14.sp,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
            ),
            SizedBox(height: 40.h),

            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Email Address',
              ),
            ),
            SizedBox(height: 40.h),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VerificationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? Colors.grey.shade900 : Colors.blue.shade600,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 55.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                elevation: 0,
              ),
              child: Text('Get Link', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
