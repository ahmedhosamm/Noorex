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

            SizedBox(height:40.h),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'إنشاء حساب',
                    style: AppTexts.heading1Bold.copyWith(
                      color: AppColors.neutral1000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'الرجاء إدخال بريدك الإلكتروني وسنرسل رمز التأكيد إلى بريدك الإلكتروني',
                    textAlign: TextAlign.center,
                    style: AppTexts.contentRegular.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            CustomTextFormFieldWidget(
              controller: emailController,
              labelText: 'اسم المستخدم',
              hintText: 'قم بإدخال اسم المستخدم الخاص بك هنا',
            ),

            SizedBox(height: 18.h),

            CustomTextFormFieldWidget(
              controller: emailController,
              labelText: 'البريد الإلكتروني',
              hintText: 'قم بإدخال بريدك الإلكتروني الخاص بك هنا',
            ),

            SizedBox(height: 18.h),

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

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text.rich(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    TextSpan(
                      text: 'أوافق على ',
                      style: AppTexts.contentRegular.copyWith(
                        color: AppColors.neutral600,
                      ),
                      children: [
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
                    side: BorderSide(color: AppColors.neutral600,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                    onChanged: (val) => setState(() => isAgreed = val!),
                  ),
                ),
              ],
            ),


            const Spacer(),

            Center(
              child: Text.rich(
                TextSpan(
                  text: 'لدي لديك حساب ؟',
                  style: AppTexts.contentRegular.copyWith(
                    color: AppColors.neutral300,
                  ),
                  children: [
                    WidgetSpan(child: SizedBox(width: 4.w)),
                    TextSpan(
                      text: 'تسجيل الدخول',
                      style: AppTexts.contentEmphasis.copyWith(
                        color: AppColors.secondary500,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push('/login');
                        },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 18.h),

            CustomButtonWidget(
              text: 'التالي',
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
