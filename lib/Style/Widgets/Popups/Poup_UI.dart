import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../Theme/App_Colors.dart';
import '../../Theme/App_Fonts.dart';
import '../Buttons/Custom_Button_Widget.dart';

class AppDialogs {
  static void showCommonBottomSheet({
    required BuildContext context,
    required String imagePath,
    required String title,
    required InlineSpan descriptionSpan,
    required String primaryBtnText,
    required VoidCallback onPrimaryPressed,
    String? secondaryBtnText,
    VoidCallback? onSecondaryPressed,
    bool isSvg = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,


      isDismissible: false, // Closing is prevented when pressure is applied outside the BottomSheet
      enableDrag: false,    // Prevent the BottomSheet from locking by dragging it down

      builder: (sheetContext) => Container(
        decoration: BoxDecoration(
          color: AppColors.neutral100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle (Grey Police)
          Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.neutral300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(height: 16.h),

              // Title
              Text(
                title,
                style: AppTexts.heading3Bold.copyWith(color: AppColors.neutral1000),
              ),
              SizedBox(height: 16.h),
              Divider(color: AppColors.neutral300, thickness: 1),
              SizedBox(height: 24.h),

              // Image
              isSvg
                  ? SvgPicture.asset(imagePath, width: 140.w, height: 140.w)
                  : Image.asset(imagePath, width: 140.w, height: 140.w),

              SizedBox(height: 24.h),

              // descriptionSpan
              Text.rich(
                descriptionSpan,
                style: AppTexts.featureStandard.copyWith(color: AppColors.neutral1000),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              // Button display logic
              Row(
                children: [
                  // If the second button is there, draw it and the space next to it
                  if (secondaryBtnText != null && onSecondaryPressed != null) ...[
                    Expanded(
                      child: CustomButtonWidget(
                        text: secondaryBtnText,
                        color: AppColors.neutral100,
                        textColor: AppColors.primary700,
                        borderSide: BorderSide(color: AppColors.primary700),
                        onPressed: onSecondaryPressed,
                      ),
                    ),
                    SizedBox(width: 12.w),
                  ],

                  // / The main button (always present, takes the available display)
                  Expanded(
                    child: CustomButtonWidget(
                      text: primaryBtnText,
                      color: AppColors.primary700,
                      onPressed: onPrimaryPressed,
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