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
        key: formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 40.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //square back button
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

                // input fields
                CustomTextFormFieldWidget(
                  controller: nameController,
                  labelText: 'اسم المستخدم',
                  hintText: 'قم بإدخال اسم المستخدم الخاص بك هنا',
                ),

                SizedBox(height: 18.h),

                CustomTextFormFieldWidget(
                  controller: emailController,
                  labelText: 'البريد الإلكتروني',
                  hintText: 'قم بإدخال بريدك الإلكتروني الخاص بك هنا',
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 18.h),

                CustomTextFormFieldWidget(
                  controller: phoneController,
                  labelText: 'رقم الهاتف',
                  hintText: 'قم بإدخال رقم الهاتف الخاص بك هنا',
                  keyboardType: TextInputType.phone,
                ),

                SizedBox(height: 12.h),

                // Terms and Conditions Approval Section
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
                        side:  BorderSide(color: AppColors.neutral600),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        onChanged: (val) => setState(() => isAgreed = val!),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Link back to log in
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

                // Send button with unified logic
                CustomButtonWidget(
                  text: 'التالي',
                  color: AppColors.primary700,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isAgreed) {
                        // Passing data to the OTP page with the indication that we are in signup mode
                        context.push('/OTP_Password', extra: {
                          'email': emailController.text,
                          'isFromSignup': true,
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('يرجى الموافقة على شروط الخدمة أولاً')),
                        );
                      }
                    }
                  },
                ),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to help with link texts
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