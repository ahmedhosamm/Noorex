import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Theme/App_Colors.dart';
import '../../Theme/App_Fonts.dart';

class CustomButtonWidget extends StatefulWidget {
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
    this.borderRadius = 10,
    this.borderSide,
    this.isEnabled = true,
    this.gradientColors,
    this.boxShadow,
    this.isLoading = false,
  });

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor = widget.isEnabled && !widget.isLoading
        ? (widget.color ?? AppColors.primary700)
        : AppColors.neutral300;

    final Color effectiveTextColor = widget.textColor ?? AppColors.neutral100;

    return GestureDetector(
      onTapDown: (_) => widget.isEnabled ? _controller.forward() : null,
      onTapUp: (_) => widget.isEnabled ? _controller.reverse() : null,
      onTapCancel: () => widget.isEnabled ? _controller.reverse() : null,
      onTap: (widget.isEnabled && !widget.isLoading) ? widget.onPressed : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height ?? 53.h,
          margin: widget.margin,
          padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            gradient: widget.gradientColors != null ? LinearGradient(
              colors: widget.gradientColors!,
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ) : null,
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
            border: widget.borderSide != null
                ? Border.all(color: widget.borderSide!.color, width: widget.borderSide!.width)
                : null,
            color: widget.gradientColors == null ? effectiveBackgroundColor : null,
            boxShadow: widget.boxShadow ?? [
              if (widget.isEnabled && !widget.isLoading && widget.color != AppColors.neutral100)
                BoxShadow(
                  color: AppColors.neutral1000.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 8.sp,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Center(
            child: widget.isLoading
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
                if (widget.iconData != null) ...[
                  Icon(widget.iconData, color: effectiveTextColor, size: 20.sp),
                  8.horizontalSpace,
                ],
                if (widget.imagePath != null) ...[
                  Image.asset(widget.imagePath!, color: widget.imageColor ?? effectiveTextColor, width: 20.sp),
                  8.horizontalSpace,
                ],
                if (widget.text != null)
                  Text(
                    widget.text!,
                    style: widget.textStyle ?? AppTexts.featureBold.copyWith(
                      color: effectiveTextColor,
                      fontSize: widget.fontSize?.sp,
                      fontWeight: widget.fontWeight,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}