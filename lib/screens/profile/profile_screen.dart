import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../auth/login_screen.dart';
import '../auth/forgot_password_screen.dart';
import '../preferences/content_preference_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: const AssetImage('assets/images/profile.jpeg'),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
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
                        SizedBox(height: 4.h),
                        Text(
                          'bnodtha1122@gmail.com',
                          style: TextStyle(color: Colors.white54, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),
            _buildSectionTitle('MAKE IT YOURS'),
            SizedBox(height: 15.h),
            _buildProfileOption(
              context,
              'Content Preferences',
              Icons.settings_outlined,
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContentPreferenceScreen())),
            ),

            SizedBox(height: 30.h),
            _buildSectionTitle('ACCOUNT'),
            SizedBox(height: 15.h),
            _buildProfileOption(context, 'Theme', Icons.palette_outlined, () {}),
            SizedBox(height: 12.h),
            _buildProfileOption(
              context,
              'Forgot Password',
              Icons.lock_outline,
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())),
            ),
            SizedBox(height: 12.h),
            _buildProfileOption(
              context,
              'Logout',
              Icons.logout,
              () => Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              ),
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.5),
        fontWeight: FontWeight.bold,
        fontSize: 13.sp,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title, IconData icon, VoidCallback onTap, {bool isDestructive = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: isDestructive ? Colors.redAccent : Colors.white70, size: 24.sp),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isDestructive ? Colors.redAccent : Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14.sp),
          ],
        ),
      ),
    );
  }
}
