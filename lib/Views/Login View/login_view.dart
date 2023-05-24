import 'package:beard_friends/Components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../App Constants/App Colors/app_colors.dart';
import '../../App Constants/App Fonts/app_fonts.dart';
import '../../App Constants/App Images/app_images.dart';
import '../../App Constants/App Text/text.dart';
import '../../Components/custom_button.dart';
import '../Forgot Password View/forgot_password_view.dart';
import '../Setup Barber Profile View/setup_barber_profile_view.dart';
import '../Signup View/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90.h),
                Image.asset(AppImages.mainLogo2),
                SizedBox(height: 25.h),
                const Text24(text: 'Welcome Back!'),
                SizedBox(height: 5.h),
                const Text16Medium(
                  text: 'Please Login to your Account',
                ),
                SizedBox(height: 90.h),
                CustomTextField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  onFieldSubmittedValue: (newValue) {},
                  keyBoardType: TextInputType.emailAddress,
                  obscureText: false,
                  hint: 'Email Address',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                SizedBox(height: 25.h),
                ValueListenableBuilder(
                    valueListenable: _obscurePassword,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return CustomTextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        onFieldSubmittedValue: (newValue) {},
                        keyBoardType: TextInputType.text,
                        obscureText: _obscurePassword.value,
                        hint: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obscurePassword.value = !_obscurePassword.value;
                            },
                            child: Icon(
                              _obscurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons. visibility_outlined,
                              size: 20,
                            )),
                      );
                    }),
                SizedBox(height: 20.h),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text16Medium(text: 'Forgot Password?',
                    onTap: () {
                      Get.to(() => const ForgotPasswordView());
                    },
                    )),
                SizedBox(height: 75.h),
                CustomButton(title: 'Login', onPress: () {
                  Get.to(() => const BarberProfileView());
                },),
                SizedBox(height: 45.h),
                const Text16Medium(
                  text: 'or Continue With',
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  width: 130.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.fb),
                      SizedBox(width: 25.w,),
                      Image.asset(AppImages.google),
                    ],
                  ),
                ),
                SizedBox(height: 65.h),
                InkWell(
                  onTap: (){
                    Get.to(() => const SignupView());
                  },
                  child: Text.rich(TextSpan(
                      text: "Not have an account? ",
                      style: TextStyle(
                          fontFamily: AppFonts.nunitoRegular,
                          color: AppColors.grayText,
                          fontSize: 12),
                      children: [
                        TextSpan(
                          text: 'Create One',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 12,
                            fontFamily: AppFonts.nunitoBold,
                            letterSpacing: 0.2,
                          ),
                        )
                      ])),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
