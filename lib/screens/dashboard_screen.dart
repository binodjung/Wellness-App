import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/screens/profile.screen.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //use of black background for whole screen.
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row on the top : Explore and Profile Icon horizontally
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //space_between two text
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Use of onTap to navigate to the profile.dart
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                  ),
                    ],
              ),
              SizedBox(height: 30.h),

              // Favorites and Remind Me - rectangular inline boxes
              SizedBox(
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.w,
                      height: 60.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Text(
                        'My Favorites',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Container(
                      width: 150.w,
                      height: 60.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Text(
                        'Remind Me',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              // Today's Quotes
              Text(
                "Today's Quotes",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"Your wellness is an investment, not an expense."',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '- Mr. Hegho Ohber',
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              Text(
                'Quotes',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),

              // Quote Card 1
              Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.white, size: 22.sp),
                        SizedBox(width: 15.w),
                        Text(
                          'Feeling Blessed',
                          style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
                  ],
                ),
              ),

              // Quote Card 2
              Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.celebration, color: Colors.white, size: 22.sp),
                        SizedBox(width: 15.w),
                        Text(
                          'Pride Month',
                          style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
                  ],
                ),
              ),

              // Quote Card 3
              Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 22.sp),
                        SizedBox(width: 15.w),
                        Text(
                          'Self-worth',
                          style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
                  ],
                ),
              ),

              // Quote Card 4
              Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border, color: Colors.white, size: 22.sp),
                        SizedBox(width: 15.w),
                        Text(
                          'Love',
                          style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              // Health Tips
              Text(
                'Health Tips',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breathe of Reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
