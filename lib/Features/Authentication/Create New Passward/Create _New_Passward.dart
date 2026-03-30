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
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            //Password field
            CustomTextFormFieldWidget(
              controller: passwordController,
              labelText: 'كلمة المرور',
              hintText: 'قم بإدخال كلمة المرور هنا',
              obscureText: isObscure,
              suffixIcon: _buildVisibilityIcon(),
            ),
            SizedBox(height: 18.h),

            //confirm Password field
            CustomTextFormFieldWidget(
              controller: confirmPasswordController,
              labelText: 'تأكيد كلمة المرور',
              hintText: 'أعد إدخال كلمة المرور هنا',
              obscureText: isObscure,
              suffixIcon: _buildVisibilityIcon(),
            ),

            const Spacer(),

            CustomButtonWidget(
              text: widget.isFromSignup ? 'إنشاء حساب' : 'تأكيد',
              color: AppColors.primary700,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // استدعاء الـ Popup الموحد بالوصف المنسق (TextSpan)
                  AppDialogs.showCommonBottomSheet(
                    context: context,
                    imagePath: "Assets/Icons/Svg/success_check.svg",
                    title: widget.isFromSignup ? "تم تسجيل حسابك بنجاح" : "تم تغيير كلمة المرور",


                    descriptionSpan: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.isFromSignup
                              ? "شكراً لإنضمامك إلى تطبيق نوريكس!"
                              : "تم تحديث كلمة المرور الخاصة بك بنجاح،",
                          style: AppTexts.heading2Accent.copyWith(
                            color: AppColors.neutral1000,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                        ),
                        const TextSpan(text: "\n\n"),
                        TextSpan(
                          text: widget.isFromSignup
                              ? "يمكنك الآن التمتع بالتسوق وتصفح المنتجات في التطبيق بكل سهولة."
                              : "يمكنك الآن تسجيل الدخول إلى حسابك بأمان باستخدام كلمة المرور الجديدة.",
                          style: AppTexts.featureStandard.copyWith(
                            color: AppColors.neutral600,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),

                    primaryBtnText: "هيا بنا",
                    secondaryBtnText: "إلغاء",
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

  Widget _buildVisibilityIcon() => IconButton(
    onPressed: () => setState(() => isObscure = !isObscure),
    icon: Icon(isObscure ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined, color: AppColors.neutral600),
  );

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