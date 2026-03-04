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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        if (labelText != null) ...[
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              labelText!,
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
                  autofocus: autofocus ?? false,
                  autocorrect: autocorrect ?? true,
                  enableSuggestions: enableSuggestions ?? true,
                  readOnly: readOnly ?? false,
                  showCursor: showCursor,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  onChanged: onChanged,
                  validator: validator,
                  onSaved: onSaved,
                  inputFormatters: inputFormatters,
                  textAlignVertical: textAlignVertical,
                  autofillHints: autofillHints,
                  maxLines: isChat ? null : maxLines ?? 1,
                  minLines: isChat ? null : minLines,
                  style: textStyle ?? AppTexts.contentEmphasis.copyWith(
                    color: AppColors.neutral1000,
                  ),
                  onTapOutside: isChat ? null : (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(

                    filled: true,
                    fillColor: backgroundColor ?? AppColors.neutral100,
                    contentPadding: contentPadding ?? EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: height ?? 12.h,
                    ),

                    border: _buildBorder(AppColors.neutral300),
                    enabledBorder: _buildBorder(currentBorderColor),
                    focusedBorder: _buildBorder(AppColors.primary700, width: 1.2),
                    errorBorder: _buildBorder(AppColors.red100),
                    focusedErrorBorder: _buildBorder(AppColors.red100, width: 1.2),

                    hintText: hintText,
                    hintStyle: hintStyle ?? AppTexts.contentRegular.copyWith(
                      color: AppColors.neutral500,
                    ),
                    helperText: helperText,
                    errorText: errorText,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    prefixIconColor: isFocused ? AppColors.primary700 : AppColors.neutral600,
                    suffixIconColor: isFocused ? AppColors.primary700 : AppColors.neutral600,
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