import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentPreferenceScreen extends StatefulWidget {
  const ContentPreferenceScreen({super.key});

  @override
  State<ContentPreferenceScreen> createState() => _ContentPreferenceScreenState();
}

class _ContentPreferenceScreenState extends State<ContentPreferenceScreen> {
  final Set<String> _selectedTopics = {};

  final List<String> _topics = [
    'Hard times',
    'Working out',
    'Productivity',
    'Self-esteem',
    'Achieving goals',
    'Inspiration',
    'Letting go',
    'Love',
    'Relationships',
    'Faith & Spirituality',
    'Positive thinking',
    'Stress & Anxiety',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Content Preferences', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Select all topics that motivate you.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                ),
                itemCount: _topics.length,
                itemBuilder: (context, index) {
                  final topic = _topics[index];
                  final isSelected = _selectedTopics.contains(topic);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedTopics.remove(topic);
                        } else {
                          _selectedTopics.add(topic);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.grey.shade800,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        topic,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white70,
                          fontSize: 14.sp,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 55.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                ),
                child: Text('Save Preferences', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
