import 'package:beard_friends/App%20Constants/App%20Colors/app_colors.dart';
import 'package:beard_friends/App%20Constants/App%20Images/app_images.dart';
import 'package:beard_friends/Components/custom_container2.dart';
import 'package:beard_friends/Components/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../App Constants/App Text/text.dart';
import '../Add Staff View/add_staff_view.dart';
import '../Member Profile View/member_profile_view.dart';

class StaffView extends StatefulWidget {
  const StaffView({Key? key}) : super(key: key);

  @override
  State<StaffView> createState() => _StaffViewState();
}

class _StaffViewState extends State<StaffView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .025),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90.h),
            const Align(
                alignment: Alignment.topLeft,
                child: Text24(
                  text: 'Staff',
                )),
            SizedBox(height: 5.h),
            const Align(
              alignment: Alignment.topLeft,
              child: Text16Medium(
                text: 'Manage Your Staff',
              ),
            ),
            SizedBox(height: 40.h),
            CustomContainer2(
              h: 100.h,
              w: double.infinity,
              child: Center(
                child: ListTile(
                    onTap: () {
                      Get.to(() => const MemberProfileView());
                    },
                    title: Text18Regular(
                      text: 'Aidda Aidaa',
                      textColor: AppColors.primaryText,
                    ),
                    subtitle: Text14(
                      text: 'ID 545745124',
                      textColor: AppColors.grayText2,
                    ),
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AppImages.profile),
                    ),
                    trailing: CustomTextButton(
                        color: AppColors.deleteButton,
                        title: 'Delete',
                        onTap: () {},
                        height: 40.h,
                        width: 75.w)),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.floatingButton,
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(() => const AddStaffView());
        },
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
