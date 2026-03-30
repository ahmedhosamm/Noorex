import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../../../Style/Theme/Base_Screen.dart';
import '../../../Style/Widgets/Buttons/Custom_Button_Widget.dart';
import '../../../Style/Widgets/Text Field/Custom_Text_Field_Widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  void dispose() {
    // Dispose controllers to free up memory
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Form(
        key: formKey, // Form key for input validation logic
        child: Column(
          // Align items to the Right (RTL Start)
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Top Navigation: Back Button
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

            // Header: Title and Description
            Center(
              child: Column(
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: AppTexts.heading1Bold.copyWith(color: AppColors.neutral1000),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'الرجاء إدخال بريدك الإلكتروني وكلـمة المرور للوصول إلى حسابك.',
                    textAlign: TextAlign.center,
                    style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            // Email Input Field with Format Validation
            CustomTextFormFieldWidget(
              controller: emailController,
              labelText: 'البريد الإلكتروني',
              hintText: 'قم بإدخال بريدك الإلكتروني الخاص بك هنا',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال البريد الإلكتروني';
                }

                // Regular Expression for a valid email format
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

            // Password Input Field
            CustomTextFormFieldWidget(
              controller: passwordController,
              labelText: 'كلـمة المرور',
              hintText: 'قم بإدخال كلـمة المرور الخاص بك هنا',
              obscureText: isObscure,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال كلمة المرور';
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () => setState(() => isObscure = !isObscure),
                icon: Icon(
                  isObscure ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                  color: AppColors.neutral600,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // Forgot Password Navigation Link (Aligned Left)
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => context.push('/forgot_Password'),
                child: Text(
                  'نسيت كلـمة السر؟',
                  style: AppTexts.contentRegular.copyWith(
                    color: AppColors.secondary500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Registration Navigation Link
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'ليس لديك حساب ؟',
                  style: AppTexts.contentRegular.copyWith(color: AppColors.neutral300),
                  children: [
                    WidgetSpan(child: SizedBox(width: 4.w)),
                    TextSpan(
                      text: 'إنشاء حساب',
                      style: AppTexts.contentEmphasis.copyWith(
                        color: AppColors.secondary500,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push('/Signup'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 18.h),

            // Main Login Action Button
            CustomButtonWidget(
              text: 'تسجيل دخول',
              color: AppColors.primary700,
              onPressed: () {
                // Check if all input fields are valid before proceeding
                if (formKey.currentState!.validate()) {
                  context.go('/HomeScreen');
                }
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}