import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilInitWrapper extends StatelessWidget {
  final Widget child;

  const ScreenUtilInitWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design base
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => child,
    );
  }
}
