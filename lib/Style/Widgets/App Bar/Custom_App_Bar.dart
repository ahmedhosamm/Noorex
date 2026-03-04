import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Theme/App_Colors.dart';
import '../../Theme/App_Fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  final VoidCallback? onBack;
  final Widget? actionIcon;
  final VoidCallback? onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hasLeading = true,
    this.onBack,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        border: Border(
          bottom: BorderSide(
            color: AppColors.neutral200,
            width: 1.h,
          ),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 56.h,
          child: Row(
            children: [
              // Back Button
              if (hasLeading)
                _buildAppBarButton(
                  onPressed: onBack ?? () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.neutral1000,
                    size: 18.sp,
                  ),
                )
              else
                SizedBox(width: 48.w),

              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTexts.heading3Bold.copyWith(
                    color: AppColors.neutral1000,
                  ),
                ),
              ),

              // Another Button
              _buildAppBarButton(
                onPressed: onActionPressed ?? () {},
                child: actionIcon ?? SvgPicture.asset(
                  "Assets/Icons/Svg/Notification.svg",
                  width: 22.w,
                  height: 22.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.neutral1000,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // AppBar
  Widget _buildAppBarButton({required VoidCallback onPressed, required Widget child}) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.neutral200.withValues(alpha: 0.5),
        ),
        child: child,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}