import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Features/Splash/View UI/Splash_Screen.dart';
import 'Style/Theme/App_Colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(390, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Noorex',

          // إعدادات الـ Theme الأساسية للأبلكيشن
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.neutral100,
            fontFamily: 'Cairo',
          ),

          // البداية هتكون من صفحة الـ Splash
          home: const SplashScreen(),
        );
      },
    );
  }
}