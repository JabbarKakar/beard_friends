import 'package:beard_friends/Views/Change%20Password/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../App Constants/App Colors/app_colors.dart';
import '../../App Constants/App Fonts/app_fonts.dart';
import '../../App Constants/App Text/text.dart';
import '../../Components/custom_button.dart';
import '../../Components/custom_container2.dart';
import '../../Components/custom_containers.dart';
import '../../Components/custom_text_field.dart';
import '../Login View/login_view.dart';
import '../Shop Details View/shop_details_view.dart';

class SecurityView extends StatefulWidget {
  const SecurityView({Key? key}) : super(key: key);

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Icon(
                Icons.arrow_back_ios_new_sharp,
                size: 13,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text24(
                    text: 'Privacy & Security',
                  )),
              SizedBox(height: 5.h),
              const Align(
                alignment: Alignment.topLeft,
                child: Text16Medium(
                  text: 'Protect Your Account',
                ),
              ),
              SizedBox(height: 40.h),
              CustomContainer2(h: 80.h, w: double.infinity,
                child: Center(
                  child: ListTile(
                    onTap: (){
                      Get.to(() => const ChangePasswordView());
                    },
                    title: const Text16Regular(text: 'Change Password'),
                    trailing: Icon(Icons.arrow_forward_ios, color: AppColors.grayText,),
                  ),
                ),

              ),
              SizedBox(height: 15.h),
              CustomContainer2(h: 80.h, w: double.infinity,
                child: Center(
                  child: ListTile(
                    onTap: (){
                      Get.to(() => const SecurityView());
                    },
                    title: const Text16Regular(text: 'Data Privacy'),
                    trailing: Icon(Icons.public_outlined, color: AppColors.grayText,),
                  ),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
