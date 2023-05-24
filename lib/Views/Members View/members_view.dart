import 'package:beard_friends/App%20Constants/App%20Fonts/app_fonts.dart';
import 'package:beard_friends/Components/custom_button.dart';
import 'package:beard_friends/Components/custom_container2.dart';
import 'package:beard_friends/Components/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../App Constants/App Colors/app_colors.dart';
import '../../App Constants/App Images/app_images.dart';
import '../../App Constants/App Text/text.dart';

class MembersView extends StatefulWidget {
  const MembersView({Key? key}) : super(key: key);

  @override
  State<MembersView> createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text24(
                    text: 'Your Members',
                  )),
              SizedBox(height: 5.h),
              const Align(
                alignment: Alignment.topLeft,
                child: Text16Medium(
                  text: 'All of your Current Members',
                ),
              ),
              SizedBox(height: 40.h),
              SizedBox(
                height: 900.h,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: const MyTile(title: 'John Doe', subtitle: 'Coins Collected',
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppImages.profile),
                          ),

                        ),
                      );
                    }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
