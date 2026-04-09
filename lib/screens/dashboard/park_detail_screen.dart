import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/favorites_controller.dart';

class ParkDetailScreen extends StatefulWidget {
  const ParkDetailScreen({super.key});

  @override
  State<ParkDetailScreen> createState() => _ParkDetailScreenState();
}

class _ParkDetailScreenState extends State<ParkDetailScreen> {
  final List<String> parkPhotos = const [
    'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=2040&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1596434413175-9e6ecb009e0b?q=80&w=2070&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1588619623828-56b068297b81?q=80&w=2071&auto=format&fit=crop',
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
            // Image Carousel
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
                      ValueListenableBuilder<List<String>>(
                        valueListenable: favoriteItems,
                        builder: (context, favorites, _) {
                          final isFavorite = favorites.contains('Central Green Park');
                          return IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () => toggleFavorite('Central Green Park'),
                          );
                        },
                      ),
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
                  
                  // SECTION 1
                  _buildSectionTitle('SECTION 1: Overview'),
                  SizedBox(height: 12.h),
                  Text(
                    'Central Green Park is a premier destination for outdoor fitness. It offers a unique combination of nature and exercise equipment.',
                    style: TextStyle(fontSize: 15.sp, height: 1.5),
                  ),
                  
                  SizedBox(height: 25.h),
                  
                  // SECTION 2
                  _buildSectionTitle('SECTION 2: Amenities'),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: [
                      _buildFeatureChip(Icons.directions_run, 'Jogging Track'),
                      _buildFeatureChip(Icons.spa, 'Yoga Zone'),
                      _buildFeatureChip(Icons.fitness_center, 'Outdoor Gym'),
                    ],
                  ),
                  
                  SizedBox(height: 25.h),
                  
                  // SECTION 3
                  _buildSectionTitle('SECTION 3: Gallery & Location'),
                  SizedBox(height: 12.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1519331379826-f10be5486c6f?q=80&w=2070&auto=format&fit=crop',
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
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
