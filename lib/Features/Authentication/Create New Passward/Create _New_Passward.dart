import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Style/Theme/App_Colors.dart';
import '../../../Style/Theme/App_Fonts.dart';
import '../../../Style/Theme/Base_Screen.dart';
import '../../../Style/Widgets/Buttons/Custom_Button_Widget.dart';
import '../../../Style/Widgets/Text Field/Custom_Text_Field_Widget.dart';

class Create_New_Password extends StatefulWidget {
  const Create_New_Password({super.key});

  @override
  State<Create_New_Password> createState() => _Create_New_PasswordState();
}

class _Create_New_PasswordState extends State<Create_New_Password> {
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
                    'كلمة المرور',
                    style: AppTexts.heading1Bold.copyWith(
                      color: AppColors.neutral1000,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'يرجي إضافة كلمة مرور قوية للحفاظ على بياناتك',
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

            SizedBox(height: 18.h),

            CustomTextFormFieldWidget(
              controller: passwordController,
              labelText: 'تاكيد كلمة المرور',
              hintText: 'قم بإدخال تاكيد كلمة المرور الخاص بك هنا',
              obscureText: isObscure,
              suffixIcon: IconButton(
                onPressed: () => setState(() => isObscure = !isObscure),
                icon: Icon(isObscure ? Icons.visibility_off_outlined  : Icons.remove_red_eye_outlined,
                    color: AppColors.neutral600),
              ),
            ),

            SizedBox(height: 8.h),


            const Spacer(),

            CustomButtonWidget(
              text: 'انشاء حساب',
              color: AppColors.primary700,
              onPressed: () {

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    contentPadding: EdgeInsets.all(24.w),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "تم تسجيل حسابك بنجاح",
                          style: AppTexts.heading3Bold.copyWith(color: AppColors.neutral1000),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "هشكرًا لإنضمامك إلى تطبيق نوريكس , يمكنك الآن التمتع و التسوق في التطبيق.",
                          textAlign: TextAlign.center,
                          style: AppTexts.contentRegular.copyWith(color: AppColors.neutral600),
                        ),
                        SizedBox(height: 32.h),
                        Row(
                          children: [
                            // زرار الإلغاء
                            Expanded(
                              child: CustomButtonWidget(
                                text: "هيا بنا",
                                color: AppColors.primary700,
                                height: 48.h, // نفس الارتفاع اللي بتستخدمه
                                borderRadius: 10,
                                onPressed: () {
                                  Navigator.pop(context); // نقفل الـ Popup الأول
                                  context.push('/login'); // نفتح صفحة اللوجين
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
