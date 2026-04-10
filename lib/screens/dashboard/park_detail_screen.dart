import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/favorites_controller.dart';

class ParkDetailScreen extends StatelessWidget {
  final Map<String, String> park;

  const ParkDetailScreen({super.key, required this.park});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(park['name']!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Park Image
            Hero(
              tag: park['name']!,
              child: Image.asset(
                park['image']!,
                height: 280.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          park['name']!,
                          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ValueListenableBuilder<List<String>>(
                        valueListenable: favoriteItems,
                        builder: (context, favorites, _) {
                          final isFavorite = favorites.contains(park['name']!);
                          return IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 28.sp,
                            ),
                            onPressed: () => toggleFavorite(park['name']!),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 20, color: Colors.blueAccent),
                      SizedBox(width: 8.w),
                      Text(
                        '${park['distance']} away • ${park['location']}',
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 30.h),
                  
                  // SECTION 1: About
                  _buildSectionTitle('SECTION 1: About the Park'),
                  SizedBox(height: 12.h),
                  Text(
                    park['description'] ?? 'This is a beautiful park located in the heart of the city, perfect for outdoor activities, relaxation, and wellness.',
                    style: TextStyle(fontSize: 15.sp, height: 1.6, color: isDark ? Colors.white70 : Colors.black87),
                  ),
                  
                  SizedBox(height: 30.h),
                  
                  // SECTION 2: Amenities
                  _buildSectionTitle('SECTION 2: Available Amenities'),
                  SizedBox(height: 15.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: [
                      _buildFeatureChip(Icons.directions_run, 'Running Track'),
                      _buildFeatureChip(Icons.spa, 'Yoga Area'),
                      _buildFeatureChip(Icons.fitness_center, 'Outdoor Gym'),
                      _buildFeatureChip(Icons.landscape, 'Green Zone'),
                    ],
                  ),
                  
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 55.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                      elevation: 0,
                    ),
                    child: Text('Get Directions', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent),
    );
  }

  Widget _buildFeatureChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.blueAccent),
          SizedBox(width: 8.w),
          Text(label, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
