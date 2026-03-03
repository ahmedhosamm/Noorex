import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),

            // زرار الرجوع
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(4.r),
                child: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.neutral300, width: 1.5.w),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    size: 18.sp,
                    color: AppColors.neutral1000,
                  ),
                ),
              ),
            ),

            SizedBox(height:40.h),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: AppTexts.heading1Bold.copyWith(
                      color: AppColors.neutral1000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'الرجاء إدخال بريدك الإلكتروني وكلـمة المرور للوصول إلى حسابك.',
                    textAlign: TextAlign.center,
                    style: AppTexts.contentRegular.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            // البريد الإلكتروني
            CustomTextFormFieldWidget(
              controller: emailController,
              labelText: 'البريد الإلكتروني',
              hintText: 'قم بإدخال بريدك الإلكتروني الخاص بك هنا',
            ),

            SizedBox(height: 24.h),

            // كلمة المرور
            CustomTextFormFieldWidget(
              controller: passwordController,
              labelText: 'كلـمة المرور',
              hintText: 'قم بإدخال كلـمة المرور الخاص بك هنا',
              obscureText: isObscure,
              suffixIcon: IconButton(
                onPressed: () => setState(() => isObscure = !isObscure),
                icon: Icon(isObscure ? Icons.visibility_off_outlined  : Icons.remove_red_eye_outlined,
                    color: AppColors.neutral600),
              ),
            ),

            SizedBox(height: 8.h),

            // أوافق على سياسة الخصوصية و شروط الخدمة
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text.rich(
                    textAlign: TextAlign.right, // محاذاة النص لليمين
                    textDirection: TextDirection.rtl,
                    TextSpan(
                      text: 'أوافق على ',
                      style: AppTexts.contentRegular.copyWith(
                        color: AppColors.neutral600,
                      ),
                      children: [
                        // 1. شروط الخدمة
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: InkWell(
                            onTap: () => print("Terms"),
                            child: Text(
                              'شروط الخدمة',
                              style: AppTexts.contentEmphasis.copyWith(
                                color: AppColors.secondary500,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.secondary500,
                              ),
                            ),
                          ),
                        ),
                        const TextSpan(text: '  و '),
                        // 2. سياسة الخصوصية
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: InkWell(
                            onTap: () => print("Privacy"),
                            child: Text(
                              'سياسة الخصوصية',
                              style: AppTexts.contentEmphasis.copyWith(
                                color: AppColors.secondary500,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.secondary500,
                              ),
                            ),
                          ),
                        ),
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
                    side: BorderSide(color: AppColors.neutral1000, width: 1.5.w), // برواز غامق شوية زي الصورة
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                    onChanged: (val) => setState(() => isAgreed = val!),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),
            // نسيت كلمه المرور
            GestureDetector(
              onTap: () {},
              child: Text(
                  'نسيت كلـمة السر؟',
                  style: AppTexts.contentRegular.copyWith(
                    color: AppColors.secondary500,
                    decoration: TextDecoration.underline,
                  )
              ),
            ),

            const Spacer(),

            // إنشاء حساب
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                    text: 'ليس لديك حساب ؟', // شلنا المسافة اليدوية من هنا
                    style: AppTexts.contentRegular.copyWith(
                      color: AppColors.neutral300,
                    ),
                    children: [
                      // إضافة مسافة 4 بالضبط
                      WidgetSpan(child: SizedBox(width: 4.w)),
                      TextSpan(
                        text: 'إنشاء حساب',
                        style: AppTexts.contentEmphasis.copyWith(
                          color: AppColors.secondary500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 18.h),

            // زرار تسجيل دخول
            CustomButtonWidget(
              text: 'تسجيل دخول',
              color: AppColors.primary700,
              onPressed: () {},
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}