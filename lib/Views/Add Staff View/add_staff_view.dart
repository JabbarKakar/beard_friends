import 'package:beard_friends/App%20Constants/App%20Colors/app_colors.dart';
import 'package:beard_friends/Components/custom_button.dart';
import 'package:beard_friends/Components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../App Constants/App Text/text.dart';

class AddStaffView extends StatefulWidget {
  const AddStaffView({Key? key}) : super(key: key);

  @override
  State<AddStaffView> createState() => _AddStaffViewState();
}

class _AddStaffViewState extends State<AddStaffView> {

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.whiteColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90.h),
            const Align(
                alignment: Alignment.topLeft,
                child: Text24(
                  text: 'Add Staff',
                )),
            SizedBox(height: 5.h),
            const Align(
              alignment: Alignment.topLeft,
              child: Text16Medium(
                text: 'Fill the Blanks to Add',
              ),
            ),
            SizedBox(height: 40.h),
            Text18Regular(text: 'Staff Email', textColor: AppColors.grayText2),
            SizedBox(height: 20.h),
            CustomTextField(
                controller: emailController,
                focusNode: emailFocusNode,
                onFieldSubmittedValue: (newValue){},
                keyBoardType: TextInputType.emailAddress,
                obscureText: false,
            hint: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            SizedBox(height: 200.h),
            CustomButton(title: 'Invite', onPress: (){})
          ],
        ),
      ),
    );
  }
}
