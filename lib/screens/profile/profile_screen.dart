import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/theme_controller.dart';
import 'package:wellness_app/core/favorites_controller.dart';
import '../auth/login_screen.dart';
import '../auth/forgot_password_screen.dart';
import '../preferences/content_preference_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
                color: isDark ? Colors.grey.shade900 : Colors.blue.shade50,
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
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'bnodtha1122@gmail.com',
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            
            // Favorites Section (NEW)
            _buildSectionTitle('MY FAVORITES'),
            SizedBox(height: 15.h),
            ValueListenableBuilder<int>(
              valueListenable: favoriteCount,
              builder: (context, count, _) {
                return _buildProfileOption(
                  context,
                  'Total Favorites: $count',
                  Icons.favorite,
                  () {
                    // Show dialog with favorite names
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('My Favorites'),
                        content: favoriteItems.value.isEmpty 
                          ? const Text('No favorites yet.')
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: favoriteItems.value.map((e) => ListTile(title: Text(e))).toList(),
                            ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            SizedBox(height: 30.h),

            _buildSectionTitle('SETTINGS'),
            SizedBox(height: 15.h),
            _buildProfileOption(
              context,
              'Content Preferences',
              Icons.settings_outlined,
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContentPreferenceScreen())),
            ),
            SizedBox(height: 12.h),
            
            // Theme Section (UPDATED)
            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeNotifier,
              builder: (context, mode, _) {
                return _buildProfileOption(
                  context,
                  'Theme: ${mode == ThemeMode.dark ? "Dark" : "Light"}',
                  Icons.palette_outlined,
                  () {
                    themeNotifier.value = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
                  },
                );
              },
            ),
            
            SizedBox(height: 12.h),
            _buildProfileOption(
              context,
              'Change Password',
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
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 13.sp,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title, IconData icon, VoidCallback onTap, {bool isDestructive = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: isDestructive ? Colors.redAccent : (isDark ? Colors.white70 : Colors.black54), size: 22.sp),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isDestructive ? Colors.redAccent : (isDark ? Colors.white : Colors.black87),
                  fontSize: 16.sp,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14.sp),
          ],
        ),
      ),
    );
  }
}
