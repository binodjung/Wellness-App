import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage: const AssetImage('assets/images/profile.jpeg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              Row(
                children: [
                  Expanded(
                    child: _buildActionCard('My Favorites', Icons.favorite_outline),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: _buildActionCard('Remind Me', Icons.notifications_none),
                  ),
                ],
              ),

              SizedBox(height: 30.h),
              Text(
                "Today's Quote",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade900, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"Your wellness is an investment, not an expense."',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      '- Mr. Hegho Ohber',
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),

              _buildCategoryTile('Feeling Blessed', Icons.favorite, Colors.pinkAccent),
              _buildCategoryTile('Pride Month', Icons.celebration, Colors.orangeAccent),
              _buildCategoryTile('Self-worth', Icons.star, Colors.blueAccent),
              _buildCategoryTile('Love', Icons.favorite_border, Colors.redAccent),
              
              SizedBox(height: 30.h),
              Text(
                'Health Tips',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),

              _buildCategoryTile('Breathe of Reset', Icons.air, Colors.tealAccent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon) {
    return Container(
      height: 70.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white70, size: 20.sp),
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(String title, IconData icon, Color iconColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 24.sp),
              SizedBox(width: 15.w),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 14.sp),
        ],
      ),
    );
  }
}
