import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wellness_app/core/theme_controller.dart';
import 'package:wellness_app/screens/auth/login_screen.dart';
import 'package:wellness_app/screens/auth/signup_screen.dart';
import 'package:wellness_app/screens/dashboard/dashboard_screen.dart';
import 'package:wellness_app/screens/quotes/quote_detail_screen.dart';

void main() {
  runApp(const WellnessApp());
}

class WellnessApp extends StatelessWidget {
  const WellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Wellness',
            themeMode: currentMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Poppins',
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
                iconTheme: IconThemeData(color: Colors.black),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black,
              fontFamily: 'Poppins',
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                elevation: 0,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
