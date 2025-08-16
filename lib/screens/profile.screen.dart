import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/screens/dashboard_screen.dart';
import 'package:wellness_app/screens/login_screen.dart';
import 'package:wellness_app/content/content_preference.dart';
import 'package:wellness_app/passwords/forgotpassword.dart';
import 'package:wellness_app/passwords/newpassword.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.r,
                    height: 80.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Binod Thapa',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'bnodtha1122@gmail.com',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            Text(
              'MAKE IT YOURS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 15.h),

            // Content Preference
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ContentPreference()),
                );
              },
              child: Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.white, size: 28.sp),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Text(
                        'Content Preferences',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18.sp),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30.h),

            Text(
              'ACCOUNT',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 15.h),

            // Theme container
            Container(
              height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.color_lens_outlined, color: Colors.white, size: 28.sp),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Text(
                      'Theme',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18.sp),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            // Forgot Password container wrapped properly
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ForgotPasswordPage()),
                );
              },
              child: Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lock_outline, color: Colors.white, size: 28.sp),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18.sp),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15.h),

            // Logout container
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.white, size: 28.sp),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18.sp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
