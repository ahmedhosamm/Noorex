import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../../../Style/Theme/Base_Screen.dart';
import '../../../Style/Widgets/Buttons/Custom_Button_Widget.dart';
import '../../../Style/Widgets/Text Field/Custom_Text_Field_Widget.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscure = true;
  bool isAgreed = false;

  @override
  void dispose() {
    // Dispose controllers to free memory and prevent leaks
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Form(
        key: formKey, // Assigning GlobalKey for input validation
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 40.h,
            child: Column(
              // Aligning elements to the right for RTL layout
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Top navigation back button
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => context.pop(),
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        border: Border.all(color: AppColors.neutral300, width: 1.w),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        size: 18.sp,
                        color: AppColors.neutral1000,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                // Header section with Title and Description
                Center(
                  child: Column(
                    children: [
                      Text(
                        'إنشاء حساب',
                        style: AppTexts.heading1Bold.copyWith(color: AppColors.neutral1000),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'الرجاء إدخال بياناتك وسنرسل رمز التأكيد إلى بريدك الإلكتروني',
                        textAlign: TextAlign.center,
                        style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                // Username field with basic non-empty validation
                CustomTextFormFieldWidget(
                  controller: nameController,
                  labelText: 'اسم المستخدم',
                  hintText: 'قم بإدخال اسم المستخدم الخاص بك هنا',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال اسم المستخدم';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 18.h),

                // Email field with strict format validation
                CustomTextFormFieldWidget(
                  controller: emailController,
                  labelText: 'البريد الإلكتروني',
                  hintText: 'قم بإدخال بريدك الإلكتروني الخاص بك هنا',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال البريد الإلكتروني';
                    }

                    // Regex for valid email address format
                    final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                    ).hasMatch(value);

                    if (!emailValid) {
                      return 'يرجى إدخال بريد إلكتروني صالح';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 18.h),

                // Phone field with non-empty validation
                CustomTextFormFieldWidget(
                  controller: phoneController,
                  labelText: 'رقم الهاتف',
                  hintText: 'قم بإدخال رقم الهاتف الخاص بك هنا',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال رقم الهاتف';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 12.h),

                // Terms and Conditions checkbox section
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text.rich(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        TextSpan(
                          text: 'أوافق على ',
                          style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600),
                          children: [
                            _linkTextSpan('شروط الخدمة', () => print("Terms")),
                            const TextSpan(text: '  و '),
                            _linkTextSpan('سياسة الخصوصية', () => print("Privacy")),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Checkbox(
                        value: isAgreed,
                        activeColor: AppColors.primary700,
                        side: BorderSide(color: AppColors.neutral600),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        onChanged: (val) => setState(() => isAgreed = val!),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Navigation link back to Login screen
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'لديك حساب بالفعل ؟ ',
                      style: AppTexts.contentRegular.copyWith(color: AppColors.neutral300),
                      children: [
                        TextSpan(
                          text: 'تسجيل الدخول',
                          style: AppTexts.contentEmphasis.copyWith(
                            color: AppColors.secondary500,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.push('/login'),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 18.h),

                // Submit button with dual validation (Fields + Terms)
                CustomButtonWidget(
                  text: 'التالي',
                  color: AppColors.primary700,
                  onPressed: () {
                    // Check if input fields are valid
                    if (formKey.currentState!.validate()) {
                      // Check if the user agreed to terms
                      if (isAgreed) {
                        context.push('/OTP_Password', extra: {
                          'email': emailController.text,
                          'isFromSignup': true,
                        });
                      } else {
                        // Display floating snackbar if terms are not accepted
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'يرجى الموافقة على شروط الخدمة أولاً',
                              textDirection: TextDirection.rtl,
                              style: AppTexts.contentRegular.copyWith(color: Colors.white),
                            ),
                            backgroundColor: AppColors.primary1000,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          ),
                        );
                      }
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for clickable rich text links
  TextSpan _linkTextSpan(String text, VoidCallback onTap) {
    return TextSpan(
      text: text,
      style: AppTexts.contentEmphasis.copyWith(
        color: AppColors.secondary500,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }
}