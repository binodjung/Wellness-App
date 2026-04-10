import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/favorites_controller.dart';
import 'park_detail_screen.dart';

class ParkListScreen extends StatelessWidget {
  const ParkListScreen({super.key});

  final List<Map<String, String>> parks = const [
    {
      'name': 'Central Green Park',
      'location': 'Downtown Wellness',
      'distance': '0.5 km',
      'rating': '4.5',
      'reviews': '265',
      'image': 'assets/images/park1.png',
      'description': 'Central Green Park is the heart of the city\'s fitness scene. It features a professional rubberized 2km jogging track and a massive open-air yoga pavillion.',
    },
    {
      'name': 'Skyline View Park',
      'location': 'Upper East Side',
      'distance': '1.2 km',
      'rating': '4.8',
      'reviews': '150',
      'image': 'assets/images/park2.png',
      'description': 'Perched on the hills, Skyline View Park offers breathtaking city views while you exercise. It is famous for its outdoor high-intensity training equipment.',
    },
    {
      'name': 'Riverside Trail Park',
      'location': 'West Coast',
      'distance': '2.1 km',
      'rating': '4.2',
      'reviews': '120',
      'image': 'assets/images/park3.png',
      'description': 'Experience peace as you run alongside the river. This park provides a cool breeze and shaded benches for post-workout recovery.',
    },
    {
      'name': 'Echo Valley Nature Park',
      'location': 'North Hills',
      'distance': '3.5 km',
      'rating': '4.7',
      'reviews': '310',
      'image': 'assets/images/park4.png',
      'description': 'A true escape into nature. Echo Valley is dense with trees and features a challenging uphill running course for seasoned athletes.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parks Near Me'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              children: [
                _buildFilterChip('Sort By', Icons.swap_vert),
                SizedBox(width: 10.w),
                _buildFilterChip('Filter', Icons.tune),
                SizedBox(width: 10.w),
                _buildFilterChip('Type', Icons.nature),
              ],
            ),
          ),
          
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
              ),
              itemCount: parks.length,
              itemBuilder: (context, index) {
                final park = parks[index];
                return _buildParkCard(context, park);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blueAccent),
          SizedBox(width: 6.w),
          Text(label, style: TextStyle(fontSize: 12.sp)),
          const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildParkCard(BuildContext context, Map<String, String> parkData) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ParkDetailScreen(park: parkData))),
      child: Hero(
        tag: parkData['name']!,
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade900 : Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              if (!isDark)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                      child: Image.asset(
                        parkData['image']!,
                        height: 160.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: ValueListenableBuilder<List<String>>(
                        valueListenable: favoriteItems,
                        builder: (context, favorites, _) {
                          final isFavorite = favorites.contains(parkData['name']!);
                          return Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () => toggleFavorite(parkData['name']!),
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.pinkAccent,
                                size: 20,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        parkData['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        parkData['location']!,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            parkData['distance']!,
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            parkData['rating']!,
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 4.w),
                          const Icon(Icons.star, size: 14, color: Colors.orange),
                          SizedBox(width: 4.w),
                          Text(
                            '(${parkData['reviews']})',
                            style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
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
