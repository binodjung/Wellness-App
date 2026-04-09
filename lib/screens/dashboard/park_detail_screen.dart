import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParkDetailScreen extends StatelessWidget {
  const ParkDetailScreen({super.key});

  final List<String> parkPhotos = const [
    'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=2040&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1596434413175-9e6ecb009e0b?q=80&w=2070&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1588619623828-56b068297b81?q=80&w=2071&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1519331379826-f10be5486c6f?q=80&w=2070&auto=format&fit=crop',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Park for Exercise Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel (Simulated with horizontal list)
            SizedBox(
              height: 250.h,
              child: PageView.builder(
                itemCount: parkPhotos.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    parkPhotos[index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
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
                      Text(
                        'Central Green Park',
                        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.favorite_border, color: Colors.redAccent),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 20, color: Colors.blueAccent),
                      SizedBox(width: 6.w),
                      Text('0.5 km away • Open 24/7', style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'About this Park',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Central Green Park is a beautiful urban space designed for health enthusiasts. It features a rubberized jogging track, open-air gym stations, and dedicated quiet zones for yoga and meditation. Surrounded by lush greenery, it provides the perfect escape for your morning or evening workouts.',
                    style: TextStyle(fontSize: 15.sp, height: 1.5, color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8)),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Features',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: [
                      _buildFeatureChip(Icons.directions_run, 'Jogging Track'),
                      _buildFeatureChip(Icons.spa, 'Yoga Zone'),
                      _buildFeatureChip(Icons.fitness_center, 'Outdoor Gym'),
                      _buildFeatureChip(Icons.wb_sunny, 'Sunshine Areas'),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 55.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
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

  Widget _buildFeatureChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.green),
          SizedBox(width: 8.w),
          Text(label, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
