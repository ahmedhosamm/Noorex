import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../Buttons/Custom_Button_Widget.dart';

class AppDialogs {
  static void showGuestBottomSheet({
    required BuildContext context,
    required String imagePath,
    VoidCallback? onGuestPressed,
  }) {
    const defaultBtn = CustomButtonWidget();
    final parentContext = context;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      builder: (sheetContext) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(sheetContext).size.height * 0.75,
        ),
        decoration: BoxDecoration(
          color: AppColors.neutral100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16.w,
            12.h,
            16.w,
            24.h + MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.neutral300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(height: 16.h),

              Text(
                "تسجيل كضيف",
                style: AppTexts.heading3Bold.copyWith(color: AppColors.neutral1000),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Divider(color: AppColors.neutral300, thickness: 1),
              SizedBox(height: 24.h),

              SvgPicture.asset(
                imagePath,
                width: 140.w,
                height: 140.w,
              ),
              SizedBox(height: 24.h),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "أهلاً بك! يمكنك استكشاف التطبيق وتصفح المنتجات بكل حرية",
                      style: AppTexts.heading2Accent.copyWith(
                        color: AppColors.neutral1000,
                      ),
                    ),
                    const TextSpan(text: "\n"),
                    WidgetSpan(child: SizedBox(height: 24.h)),
                    TextSpan(
                      text: "لن تتمكن من إتمام عمليات الشراء إلا بعد تسجيل الدخول أو إنشاء حساب.",
                      style: AppTexts.featureStandard.copyWith(
                        color: AppColors.neutral600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      text: "تسجيل كضيف",
                      color: AppColors.neutral100,
                      textColor: AppColors.primary700,
                      borderSide: BorderSide(color: AppColors.primary700,),
                      width: double.infinity,
                      height: defaultBtn.height ?? 53.h,
                      borderRadius: defaultBtn.borderRadius,
                      onPressed: () {
                        Navigator.of(sheetContext).pop();
                        onGuestPressed?.call();
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButtonWidget(
                      text: "تسجيل الدخول",
                      color: AppColors.primary700,
                      width: double.infinity,
                      height: defaultBtn.height ?? 53.h,
                      borderRadius: defaultBtn.borderRadius,
                      onPressed: () {
                        Navigator.of(sheetContext).pop();
                        parentContext.push('/login');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}