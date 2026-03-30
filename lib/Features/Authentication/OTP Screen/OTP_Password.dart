import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../../../Style/Theme/Base_Screen.dart';
import '../../../Style/Widgets/Buttons/Custom_Button_Widget.dart';

class OTP_Password extends StatefulWidget {
  final String email;
  final bool isFromSignup;

  const OTP_Password({super.key, required this.email, required this.isFromSignup});

  @override
  State<OTP_Password> createState() => _OTP_PasswordState();
}

class _OTP_PasswordState extends State<OTP_Password> {
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  Timer? _timer;
  int _start = 60;

  // Start countdown timer for OTP expiration
  void startTimer() {
    _timer?.cancel();
    setState(() => _start = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() => timer.cancel());
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    // Refresh UI on focus change to update border colors
    for (var node in focusNodes) node.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in otpControllers) controller.dispose();
    for (var node in focusNodes) node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(context),
          SizedBox(height: 40.h),
          Center(
            child: Column(
              children: [
                Text(
                  widget.isFromSignup ? 'تأكيد الحساب' : 'رمز التحقق',
                  style: AppTexts.heading1Bold.copyWith(color: AppColors.neutral1000),
                ),
                SizedBox(height: 12.h),
                Text('تم إرسال رمز التحقق على بريدك الإلكتروني',
                    textAlign: TextAlign.center, style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600)),
                SizedBox(height: 8.h),
                _buildEmailRow(),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          _buildOtpInputs(),
          SizedBox(height: 18.h),
          _buildTimerText(),
          const Spacer(),
          CustomButtonWidget(
            text: 'تأكيد',
            color: AppColors.primary700,
            onPressed: () {
              // Check if all 4 OTP boxes are filled
              bool isOtpComplete = otpControllers.every((controller) => controller.text.isNotEmpty);

              if (isOtpComplete) {
                // Navigate to Create New Password screen if OTP is valid
                context.push('/CreateNewPassword', extra: {
                  'email': widget.email,
                  'isFromSignup': widget.isFromSignup,
                });
              } else {
                // Show floating SnackBar if any OTP field is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'يرجى إدخال رمز التحقق كاملاً أولاً',
                      textDirection: TextDirection.rtl,
                      style: AppTexts.contentRegular.copyWith(color: Colors.white),
                    ),
                    backgroundColor: AppColors.primary1000,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  // Row containing 4 OTP input boxes
  Widget _buildOtpInputs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) => Padding(
        padding: EdgeInsets.only(left: index == 0 ? 0 : 16.w),
        child: _buildSingleBox(index),
      )),
    );
  }

  // Single OTP digit input box
  Widget _buildSingleBox(int index) {
    bool isFocused = focusNodes[index].hasFocus;
    return SizedBox(
      width: 60.w, height: 64.h,
      child: TextFormField(
        controller: otpControllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: AppTexts.heading2Bold.copyWith(color: isFocused ? Colors.green : AppColors.neutral1000),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: AppColors.neutral300)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: Colors.green, width: 1.5.w)),
        ),
        onChanged: (v) {
          // Move focus automatically to next or previous box
          if (v.length == 1 && index < 3) FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          if (v.isEmpty && index > 0) FocusScope.of(context).requestFocus(focusNodes[index - 1]);
        },
      ),
    );
  }

  // Header back button aligned to the right for RTL layout
  Widget _buildBackButton(BuildContext context) => Align(alignment: Alignment.topRight, child: InkWell(onTap: () => context.pop(), child: Container(padding: EdgeInsets.all(8.sp), decoration: BoxDecoration(border: Border.all(color: AppColors.neutral300), borderRadius: BorderRadius.circular(10.r)), child: Icon(Icons.arrow_forward_outlined, size: 18.sp))));

  // Row showing user email with an edit icon
  Widget _buildEmailRow() => Row(mainAxisAlignment: MainAxisAlignment.center, children: [InkWell(onTap: () => context.pop(), child: Icon(Icons.edit_outlined, size: 16.sp, color: AppColors.primary700)), SizedBox(width: 4.w), Text(widget.email, style: AppTexts.contentRegular.copyWith(color: AppColors.neutral1000))]);

  // Countdown timer text with resend option
  Widget _buildTimerText() => Center(child: Text.rich(TextSpan(children: [TextSpan(text: 'ستنتهي صلاحية الكود خلال ', style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600)), TextSpan(text: '( $_start ثانية ) ', style: AppTexts.contentEmphasis.copyWith(color: AppColors.secondary500)), TextSpan(text: 'إعادة إرسال', style: AppTexts.contentEmphasis.copyWith(color: _start == 0 ? AppColors.primary700 : AppColors.neutral600, decoration: TextDecoration.underline), recognizer: TapGestureRecognizer()..onTap = _start == 0 ? startTimer : null)])));
}