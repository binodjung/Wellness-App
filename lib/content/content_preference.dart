import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentPreference extends StatefulWidget {
  const ContentPreference({Key? key}) : super(key: key);

  @override
  State<ContentPreference> createState() => _ContentPreferenceState();
}

class _ContentPreferenceState extends State<ContentPreference> {
  final Set<String> selectedTopics = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Content Preferences',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selection of topic  Text
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: Text(
                'Select all topics that motivates you.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Two columns in a Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Hard times')
                                ? selectedTopics.remove('Hard times')
                                : selectedTopics.add('Hard times');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Hard times')
                                ? Colors.white : Colors.grey.shade900,  //condition sets
                            //after the selection, situation changed so the background color of container changed.
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hard times',
                            style: TextStyle(
                              color: selectedTopics.contains('Hard times')
                                  ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Working out')
                                ? selectedTopics.remove('Working out')
                                : selectedTopics.add('Working out');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Working out') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Working out',
                            style: TextStyle(
                              color: selectedTopics.contains('Working out') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Productivity')  //checks the selectedTopic
                                ? selectedTopics.remove('Productivity')  //if already selected removes
                                : selectedTopics.add('Productivity');   //if not selected , addition to the selected set.
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Productivity') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Productivity',
                            style: TextStyle(
                              color: selectedTopics.contains('Productivity') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Self-esteem')
                                ? selectedTopics.remove('Self-esteem')
                                : selectedTopics.add('Self-esteem');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Self-esteem') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Self-esteem',
                            style: TextStyle(
                              color: selectedTopics.contains('Self-esteem') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Achieving goals')
                                ? selectedTopics.remove('Achieving goals')
                                : selectedTopics.add('Achieving goals');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Achieving goals') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Achieving goals',
                            style: TextStyle(
                              color: selectedTopics.contains('Achieving goals') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Inspiration')
                                ? selectedTopics.remove('Inspiration')
                                : selectedTopics.add('Inspiration');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Inspiration') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Inspiration',
                            style: TextStyle(
                              color: selectedTopics.contains('Inspiration') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 20.w),

                // Right column
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Letting go')
                                ? selectedTopics.remove('Letting go')
                                : selectedTopics.add('Letting go');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Letting go') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Letting go',
                            style: TextStyle(
                              color: selectedTopics.contains('Letting go') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Love')
                                ? selectedTopics.remove('Love')
                                : selectedTopics.add('Love');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Love') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Love',
                            style: TextStyle(
                              color: selectedTopics.contains('Love') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Relationships')
                                ? selectedTopics.remove('Relationships')
                                : selectedTopics.add('Relationships');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Relationships') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Relationships',
                            style: TextStyle(
                              color: selectedTopics.contains('Relationships') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Faith & Spirituality')
                                ? selectedTopics.remove('Faith & Spirituality')
                                : selectedTopics.add('Faith & Spirituality');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Faith & Spirituality') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Faith & Spirituality',
                            style: TextStyle(
                              color: selectedTopics.contains('Faith & Spirituality') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Positive thinking')
                                ? selectedTopics.remove('Positive thinking')
                                : selectedTopics.add('Positive thinking');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Positive thinking') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Positive thinking',
                            style: TextStyle(
                              color: selectedTopics.contains('Positive thinking') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTopics.contains('Stress & Anxiety')
                                ? selectedTopics.remove('Stress & Anxiety')
                                : selectedTopics.add('Stress & Anxiety');
                          });
                        },
                        child: Container(
                          height: 50.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: selectedTopics.contains('Stress & Anxiety') ? Colors.white : Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Stress & Anxiety',
                            style: TextStyle(
                              color: selectedTopics.contains('Stress & Anxiety') ? Colors.black : Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
