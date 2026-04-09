import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/favorites_controller.dart';

class GymListScreen extends StatelessWidget {
  const GymListScreen({super.key});

  final List<Map<String, String>> gyms = const [
    {
      'name': 'Elite Fitness Hub',
      'distance': '0.8 km',
      'rating': '4.8',
      'image': 'https://images.unsplash.com/photo-1540497077202-7c8a3999166f?q=80&w=2070&auto=format&fit=crop',
      'details': 'Modern equipment, personal trainers, and yoga studio.',
    },
    {
      'name': 'Iron Works Gym',
      'distance': '1.2 km',
      'rating': '4.9',
      'image': 'https://images.unsplash.com/photo-1581009146145-b5ef03a7403f?q=80&w=2070&auto=format&fit=crop', // Real industrial gym photo
      'details': 'Heavy lifting, powerlifting racks, and expert strength coaching.',
    },
    {
      'name': 'Power Zone Gym',
      'distance': '1.5 km',
      'rating': '4.5',
      'image': 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?q=80&w=1975&auto=format&fit=crop',
      'details': 'Focus on bodybuilding. 24/7 access.',
    },
    {
      'name': 'Active Life Center',
      'distance': '2.5 km',
      'rating': '4.3',
      'image': 'https://images.unsplash.com/photo-1593079831268-3381b0db4a77?q=80&w=2069&auto=format&fit=crop',
      'details': 'Cardio focus, swimming pool, and group classes.',
    },
    {
      'name': 'Zenith Wellness Gym',
      'distance': '4.0 km',
      'rating': '4.6',
      'image': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop',
      'details': 'Luxury amenities, sauna, and premium supplements.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Centres Near Me'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.w),
        itemCount: gyms.length,
        itemBuilder: (context, index) {
          final gym = gyms[index];
          return Container(
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                  child: Image.network(
                    gym['image']!,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              gym['name']!,
                              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ValueListenableBuilder<List<String>>(
                            valueListenable: favoriteItems,
                            builder: (context, favorites, _) {
                              final isFavorite = favorites.contains(gym['name']!);
                              return IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                                onPressed: () => toggleFavorite(gym['name']!),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star, size: 14, color: Colors.black),
                                SizedBox(width: 4.w),
                                Text(
                                  gym['rating']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15.w),
                          const Icon(Icons.location_on, size: 16, color: Colors.blueAccent),
                          SizedBox(width: 4.w),
                          Text(gym['distance']!, style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        gym['details']!,
                        style: TextStyle(fontSize: 14.sp, color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
