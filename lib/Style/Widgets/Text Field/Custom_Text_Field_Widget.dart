import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Theme/App_Colors.dart';
import '../../Theme/App_Fonts.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? readOnly;
  final bool? showCursor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool isChat;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final Iterable<String>? autofillHints;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final double? width;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;

  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.isChat = false,
    this.textStyle,
    this.hintStyle,
    this.hintText,
    this.width,
    this.labelText,
    this.labelStyle,
    this.backgroundColor,
    this.helperText,
    this.borderColor,
    this.borderWidth,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.readOnly = false,
    this.showCursor,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.borderRadius,
    this.onSaved,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.autofillHints,
    this.contentPadding,
    this.maxLines,
    this.minLines,
    this.height,
    this.textAlignVertical,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // Forces everything (Label and Error) to align Right
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (labelText != null) ...[
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              labelText!,
              textAlign: TextAlign.right,
              style: labelStyle ?? AppTexts.highlightEmphasis.copyWith(
                color: AppColors.neutral1000,
              ),
            ),
          ),
        ],

        Focus(
          focusNode: focusNode,
          child: Builder(
            builder: (context) {
              final bool isFocused = Focus.of(context).hasFocus;

              final Color currentBorderColor = isFocused
                  ? AppColors.primary700
                  : borderColor ?? AppColors.neutral600;

              return Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  cursorColor: AppColors.primary700,
                  focusNode: focusNode,
                  controller: controller,
                  obscureText: obscureText ?? false,
                  textAlign: TextAlign.start,
                  validator: validator,
                  // Correcting alignment for Arabic inputs
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: backgroundColor ?? AppColors.neutral100,

                    // isDense is CRITICAL to remove hidden padding when using icons
                    isDense: true,

                    // Set horizontal to 0.w to eliminate the gap in both fields
                    contentPadding: contentPadding ?? EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: height ?? 12.h,
                    ),

                    errorStyle: AppTexts.contentRegular.copyWith(
                      color: Colors.red,

                    ),

                    border: _buildBorder(AppColors.neutral300),
                    enabledBorder: _buildBorder(currentBorderColor),
                    focusedBorder: _buildBorder(AppColors.primary700, width: 1.2),
                    errorBorder: _buildBorder(Colors.red),
                    focusedErrorBorder: _buildBorder(Colors.red, width: 1.2),

                    hintText: hintText,
                    hintStyle: hintStyle ?? AppTexts.contentRegular.copyWith(
                      color: AppColors.neutral500,
                    ),

                    // Prefix and Suffix handling
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,

                    // Added to ensure icons don't push the hint text unevenly
                    prefixIconConstraints: BoxConstraints(minWidth: 40.w),
                    suffixIconConstraints: BoxConstraints(minWidth: 40.w),

                    enabled: enabled ?? true,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(
        color: color,
        width: width.sp,
      ),
    );
  }
}