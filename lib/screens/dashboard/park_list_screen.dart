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
      'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=2040&auto=format&fit=crop',
    },
    {
      'name': 'Skyline Park',
      'location': 'Upper East Side',
      'distance': '1.2 km',
      'rating': '4.8',
      'reviews': '150',
      'image': 'https://images.unsplash.com/photo-1596434413175-9e6ecb009e0b?q=80&w=2070&auto=format&fit=crop',
    },
    {
      'name': 'Riverside Trail',
      'location': 'West Coast',
      'distance': '2.1 km',
      'rating': '4.2',
      'reviews': '120',
      'image': 'https://images.unsplash.com/photo-1588619623828-56b068297b81?q=80&w=2071&auto=format&fit=crop',
    },
    {
      'name': 'Echo Valley Park',
      'location': 'North Hills',
      'distance': '3.5 km',
      'rating': '4.7',
      'reviews': '310',
      'image': 'https://images.unsplash.com/photo-1519331379826-f10be5486c6f?q=80&w=2070&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parks Near Me'),
        actions: [
          IconButton(icon: const Icon(Icons.sort), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips Row (as seen in image)
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
                SizedBox(width: 10.w),
                _buildFilterChip('Distance', Icons.location_on),
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
        color: Colors.pink.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.pink.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.pinkAccent),
          SizedBox(width: 6.w),
          Text(label, style: TextStyle(fontSize: 12.sp, color: Colors.black87)),
          Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildParkCard(BuildContext context, Map<String, String> park) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ParkDetailScreen())),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Favorite
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: Image.network(
                    park['image']!,
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
                      final isFavorite = favorites.contains(park['name']!);
                      return Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () => toggleFavorite(park['name']!),
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
                    park['name']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    park['location']!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        park['distance']!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Nearby',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        park['rating']!,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4.w),
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                      SizedBox(width: 4.w),
                      Text(
                        '(${park['reviews']} Review)',
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
    );
  }
}
