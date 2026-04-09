import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/theme_controller.dart';
import '../profile/profile_screen.dart';
import 'gym_list_screen.dart';
import 'park_list_screen.dart';
import 'park_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Binod!',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Stay Fit & Healthy',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isDark ? Colors.white54 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ValueListenableBuilder<ThemeMode>(
                        valueListenable: themeNotifier,
                        builder: (context, mode, child) {
                          return Switch(
                            value: mode == ThemeMode.dark,
                            onChanged: (value) {
                              themeNotifier.value =
                                  value ? ThemeMode.dark : ThemeMode.light;
                            },
                            activeColor: Colors.amber,
                          );
                        },
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfileScreen()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: const AssetImage('assets/images/profile.jpeg'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 30.h),

              // Activity Cards Title
              Text(
                'Wellness Activities Near You',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),

              // Gym Center Card
              _buildActivityCard(
                context,
                'Gym Centre Near Me',
                'Advanced equipment • Just 1.2 km away',
                'assets/images/park1.png',
                Icons.fitness_center,
                Colors.orangeAccent,
                () => Navigator.push(context, MaterialPageRoute(builder: (_) => GymListScreen())),
              ),
              SizedBox(height: 20.h),

              // Park for Exercise Card
              _buildActivityCard(
                context,
                'Park for Exercise Near Me',
                'Fresh air • Yoga zones • 0.5 km away',
                'assets/images/park2.png',
                Icons.spa,
                Colors.greenAccent,
                () => Navigator.push(context, MaterialPageRoute(builder: (_) => ParkListScreen())),
              ),

              SizedBox(height: 30.h),

              // Today's Quote Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade900 : Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.format_quote, color: isDark ? Colors.white30 : Colors.blue.shade200, size: 40),
                    Text(
                      'The only bad workout is the one that didn\'t happen.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
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

  Widget _buildActivityCard(BuildContext context, String title, String subtitle, String imageUrl, IconData icon, Color accentColor, VoidCallback onTap) {
    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(icon, color: accentColor, size: 28),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: const Text('View Details', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
