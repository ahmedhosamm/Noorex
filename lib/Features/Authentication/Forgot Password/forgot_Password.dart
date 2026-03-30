import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../../../Style/Theme/Base_Screen.dart';
import '../../../Style/Widgets/Buttons/Custom_Button_Widget.dart';
import '../../../Style/Widgets/Text Field/Custom_Text_Field_Widget.dart';

class forgot_Password extends StatefulWidget {
  const forgot_Password({super.key});

  @override
  State<forgot_Password> createState() => _forgot_PasswordState();
}

class _forgot_PasswordState extends State<forgot_Password> {

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

            SizedBox(height: 40.h),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'نسيت كلمة المرور',
                    style: AppTexts.heading1Bold.copyWith(
                      color: AppColors.neutral1000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'الرجاء إدخال بريدك الإلكتروني لإرسال رمز التأكيد إليه',
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
              labelText: 'البريد الإلكتروني',
              hintText: 'قم بإدخال بريدك الإلكتروني الخاص بك هنا',
              keyboardType: TextInputType.emailAddress,
            ),

            const Spacer(),


            Center(
              child: Text.rich(
                TextSpan(
                  text: ' لدي حساب بالفعل ؟',
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
              text: 'ارسال',
              color: AppColors.primary700,
              onPressed: () => context.push('/OTP_Password', extra: {'email': emailController.text, 'isFromSignup': false}),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}