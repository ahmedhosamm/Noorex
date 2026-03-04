import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../Animation/Animation_UI.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Transition time: The page will wait 3 seconds and then redirect to Login
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/WelcomeScreen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedLogo(
              assetPath: 'Assets/Icons/Svg/Logo.svg',
              width: 200.w,
              height: 100.h,
              duration: const Duration(milliseconds: 1500),
            ),

            SizedBox(height: 8.h),
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.neutral100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
