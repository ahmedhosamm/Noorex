import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Theme/App_Colors.dart';
import '../../Theme/App_Fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? imagePath;
  final String? text;
  final Color? color;
  final Color? textColor;
  final Color? imageColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide? borderSide;
  final bool isEnabled;
  final TextStyle? textStyle;
  final List<Color>? gradientColors;
  final List<BoxShadow>? boxShadow;
  final bool isLoading;

  const CustomButtonWidget({
    super.key,
    this.onPressed,
    this.iconData,
    this.imagePath,
    this.imageColor,
    this.text,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.textStyle,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius = 8,
    this.borderSide,
    this.isEnabled = true,
    this.gradientColors,
    this.boxShadow,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor = isEnabled && !isLoading
        ? (color ?? AppColors.primary700)
        : AppColors.neutral300;

    final Color effectiveTextColor = textColor ?? AppColors.neutral100;

    return GestureDetector(
      onTap: (isEnabled && !isLoading) ? onPressed : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width ?? 1.sw * 0.9,
        height: height ?? 53.h,
        margin: margin,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          gradient: gradientColors != null ? LinearGradient(
            colors: gradientColors!,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ) : null,
          borderRadius: BorderRadius.circular(borderRadius.r),

          border: borderSide != null
              ? Border.all(color: borderSide!.color, width: borderSide!.width)
              : null,
          color: gradientColors == null ? effectiveBackgroundColor : null,
          boxShadow: boxShadow ?? [
            if (isEnabled && !isLoading && color != AppColors.neutral100)
              BoxShadow(
                color: AppColors.neutral1000.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 8.sp,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            width: 24.sp,
            height: 24.sp,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconData != null) ...[
                Icon(iconData, color: effectiveTextColor, size: 20.sp),
                8.horizontalSpace,
              ],
              if (imagePath != null) ...[
                Image.asset(imagePath!, color: imageColor ?? effectiveTextColor, width: 20.sp),
                8.horizontalSpace,
              ],
              if (text != null)
                Text(
                  text!,
                  style: textStyle ?? AppTexts.featureBold.copyWith(
                    color: effectiveTextColor,
                    fontSize: fontSize?.sp,
                    fontWeight: fontWeight,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}