import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../../../Style/Theme/Base_Screen.dart';
import '../../../Style/Widgets/Buttons/Custom_Button_Widget.dart';
import '../../../Style/Widgets/Text Field/Custom_Text_Field_Widget.dart';
import '../../../Style/Widgets/Popups/Poup_UI.dart';

class Create_New_Password extends StatefulWidget {
  final String email;
  final bool isFromSignup;

  const Create_New_Password({super.key, required this.email, required this.isFromSignup});

  @override
  State<Create_New_Password> createState() => _Create_New_PasswordState();
}

class _Create_New_PasswordState extends State<Create_New_Password> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  // Validation States for Dynamic Chips
  bool has8Chars = false;
  bool hasNumber = false;
  bool hasUpperLower = false;
  bool isMatching = false;

  @override
  void initState() {
    super.initState();
    // Listen to changes to update chips in real-time
    passwordController.addListener(_validatePassword);
    confirmPasswordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final pass = passwordController.text;
    final confirmPass = confirmPasswordController.text;

    setState(() {
      has8Chars = pass.length >= 8;
      hasNumber = RegExp(r'[0-9]').hasMatch(pass);
      hasUpperLower = RegExp(r'[A-Z]').hasMatch(pass) && RegExp(r'[a-z]').hasMatch(pass);
      isMatching = pass.isNotEmpty && pass == confirmPass;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildBackButton(context),
            SizedBox(height: 40.h),
            Center(
              child: Column(
                children: [
                  Text(
                    widget.isFromSignup ? 'إنشاء كلمة مرور' : 'كلمة المرور الجديدة',
                    style: AppTexts.heading1Bold.copyWith(color: AppColors.neutral1000),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'يرجى إضافة كلمة مرور قوية للحفاظ على بياناتك',
                    textAlign: TextAlign.center,
                    style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Password Field
            CustomTextFormFieldWidget(
              controller: passwordController,
              labelText: 'كلمة المرور',
              hintText: 'قم بإدخال كلمة المرور هنا',
              obscureText: isObscurePassword,
              suffixIcon: IconButton(
                onPressed: () => setState(() => isObscurePassword = !isObscurePassword),
                icon: Icon(isObscurePassword ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined),
              ),
            ),
            SizedBox(height: 18.h),

            // Confirm Password Field
            CustomTextFormFieldWidget(
              controller: confirmPasswordController,
              labelText: 'تأكيد كلمة المرور',
              hintText: 'أعد إدخال كلمة المرور هنا',
              obscureText: isObscureConfirmPassword,
              suffixIcon: IconButton(
                onPressed: () => setState(() => isObscureConfirmPassword = !isObscureConfirmPassword),
                icon: Icon(isObscureConfirmPassword ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined),
              ),
            ),

            SizedBox(height: 16.h),

            // Validation Chips Section
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              alignment: WrapAlignment.end,
              children: [
                _buildValidationChip('8 حروف على الأقل', has8Chars, passwordController.text.isNotEmpty),
                _buildValidationChip('تحتوي على رقم واحد على الأقل', hasNumber, passwordController.text.isNotEmpty),
                _buildValidationChip('تحتوي على حرف كبير أو صغير', hasUpperLower, passwordController.text.isNotEmpty),
                _buildValidationChip('كلمتي المرور متطابقتين', isMatching, confirmPasswordController.text.isNotEmpty),
              ],
            ),

            const Spacer(),

            CustomButtonWidget(
              text: widget.isFromSignup ? 'إنشاء حساب' : 'تأكيد',
              color: AppColors.primary700,
              onPressed: () {
                if (has8Chars && hasNumber && hasUpperLower && isMatching) {
                  // Show Success BottomSheet if all valid
                  AppDialogs.showCommonBottomSheet(
                    context: context,
                    imagePath: "Assets/Icons/Svg/success_check.svg",
                    title: widget.isFromSignup ? "انشاء حساب" : "نسيت كلمة المرور",
                    descriptionSpan: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.isFromSignup ? "شكراً لإنضمامك!" : "تم تغير كلمة المرور بنجاح",
                          style: AppTexts.heading2Accent.copyWith(color: AppColors.neutral1000, fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(child: SizedBox(height: 8.h)),
                        const TextSpan(text: "\n"),
                        TextSpan(
                          text: "يمكنك الآن تسجيل الدخول إلى حسابك بأمان.",
                          style: AppTexts.featureStandard.copyWith(color: AppColors.neutral600, height: 1.4),
                        ),
                      ],
                    ),
                    primaryBtnText: "هيا بنا",
                    onPrimaryPressed: () => context.go('/login'),
                  );
                }
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  // Helper widget to build Dynamic Chips
  Widget _buildValidationChip(String label, bool isValid, bool isNotEmpty) {
    // Initial color: Gray | Valid: Green | Invalid (after typing): Red
    Color bgColor = !isNotEmpty
        ? AppColors.neutral200 
        : (isValid ? AppColors.green10 : AppColors.red10);

    Color textColor = !isNotEmpty
        ? AppColors.neutral600
        : (isValid ? AppColors.green200 : AppColors.red100);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: AppTexts.contentRegular.copyWith(color: textColor, fontSize: 12.sp),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) => Align(
    alignment: Alignment.topRight,
    child: InkWell(
      onTap: () => context.pop(),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(border: Border.all(color: AppColors.neutral300), borderRadius: BorderRadius.circular(10.r)),
        child: Icon(Icons.arrow_forward_outlined, size: 18.sp),
      ),
    ),
  );
}