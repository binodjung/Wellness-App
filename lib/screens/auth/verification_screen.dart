import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'new_password_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  int _secondsRemaining = 30;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 30;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        setState(() => _canResend = true);
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              "Verify Code",
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Enter the 4-digit code sent to your email address.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: isDark ? Colors.white54 : Colors.black54),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60.w,
                  height: 60.w,
                  child: TextField(
                    controller: _controllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) FocusScope.of(context).nextFocus();
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 40.h),
            TextButton(
              onPressed: _canResend ? _startTimer : null,
              child: Text(
                _canResend ? "Resend Code" : "Resend in ${_secondsRemaining}s",
                style: TextStyle(color: _canResend ? Colors.blueAccent : Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const NewPasswordScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? Colors.grey.shade900 : Colors.blue.shade600,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 55.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
                elevation: 0,
              ),
              child: Text('Verify Code', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
