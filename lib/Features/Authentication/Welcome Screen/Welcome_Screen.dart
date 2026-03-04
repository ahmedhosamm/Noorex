import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../../../Style/Theme/Base_Screen.dart';
import '../../../Style/Widgets/Buttons/Custom_Button_Widget.dart';
import '../../../routes/app-router.dart';
import '../Login/Login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(

      child: Column(
        children: [
          SizedBox(height: 40.h),

          // العناوين العلوية
          Text(
            'مرحباً بك في نوريكس',
            style: AppTexts.display1Bold.copyWith(color: AppColors.neutral1000),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Text(
            'اختر طريقة التسجيل الخاصة بك',
            style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 130.h),

          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [

              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(18.w, 60.h, 18.w, 18.h),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.primary500,),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 32.h),
                    // تسجيل دخول
                    CustomButtonWidget(
                      text: 'تسجيل دخول',
                      onPressed: () {
                        context.push('/login');
                      },
                    ),

                    SizedBox(height: 12.h),

                    // انشاء حساب
                    CustomButtonWidget(
                      text: 'إنشاء حساب',
                      color: AppColors.neutral100,
                      textColor: AppColors.primary700,
                      borderSide: BorderSide(color: AppColors.primary700, ),
                      onPressed: () {
                        context.push('/Signup');
                      },
                    ),

                    SizedBox(height: 12.h),

                    // التسجيل كضيف
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text.rich(
                          TextSpan(
                            text: 'لا أريد إنشاء حساب الآن ',
                            style: AppTexts.contentRegular.copyWith(
                              color: AppColors.neutral300,
                            ),
                            children: [
                              WidgetSpan(child: SizedBox(width: 4.w)),
                              TextSpan(
                                text: 'تسجيل كضيف',
                                style: AppTexts.contentEmphasis.copyWith(
                                  color: AppColors.secondary500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // logo
              Positioned(
                top: -50.w,
                child: Container(
                  width: 100.w,
                  height: 100.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("Assets/Images/welcome.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000.r),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColors.primary10,
                        blurRadius: 0,
                        offset: const Offset(0, 0),
                        spreadRadius: 8,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}