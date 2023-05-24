import 'package:beard_friends/App%20Constants/App%20Fonts/app_fonts.dart';
import 'package:beard_friends/Components/custom_button.dart';
import 'package:beard_friends/Components/custom_container2.dart';
import 'package:beard_friends/Views/Stats%20View/Providers/stats_dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../App Constants/App Colors/app_colors.dart';
import '../../App Constants/App Text/text.dart';
import '../Members View/members_view.dart';

class StatsView extends StatefulWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  late List<_ChartData> data;
  late List<_ChartData> data2;
  TooltipBehavior? _tooltip;
  TooltipBehavior? _tooltip2;

  @override
  void initState() {
    data = [
      _ChartData('Compaign#1', 76),
      _ChartData('Compaign#2', 62),
      _ChartData('Compaign#3', 80),
      _ChartData('Compaign#4', 92),
    ];
    data2 = [
      _ChartData('Jan', 76),
      _ChartData('Feb', 90),
      _ChartData('Mar', 55),
      _ChartData('Apr', 78),
      _ChartData('May', 76),
      _ChartData('Jun', 25),
      _ChartData('Jul', 98),
      _ChartData('Aug', 55),
      _ChartData('Sep', 58),
      _ChartData('Oct', 40),
      _ChartData('Nov', 77),
      _ChartData('Dec', 82),
    ];
    _tooltip = TooltipBehavior(enable: true);
    _tooltip2 = TooltipBehavior(enable: true);
    super.initState();
  }

  String? selectedDay;
  static List<String> days = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
    "Option 5",
  ];

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
                    text: 'Statistics',
                  )),
              SizedBox(height: 5.h),
              const Align(
                alignment: Alignment.topLeft,
                child: Text16Medium(
                  text: 'View your Success Rate',
                ),
              ),
              SizedBox(height: 40.h),
              CustomContainer2(
                  h: 285.h,
                  w: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
                    child: SfCartesianChart(
                        title: ChartTitle(
                            text: 'Success Rate Per Campaign',
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primaryText,
                                fontFamily: AppFonts.nunitoRegular)),
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis:
                            NumericAxis(minimum: 0, maximum: 100, interval: 25),
                        tooltipBehavior:
                            _tooltip ?? TooltipBehavior(enable: true),
                        series: <ChartSeries<_ChartData, String>>[
                          ColumnSeries<_ChartData, String>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold',
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              color: AppColors.buttonColor)
                        ]),
                  )),
              SizedBox(height: 20.h),
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.textFieldColor,
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: AppColors.iconColor,
                        size: 20,
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Consumer<StatsDropDownProvider>(
                          builder: (context, statsDropdownProvider, child){
                            return DropdownButton(
                              underline: Container(),
                              value: statsDropdownProvider.isSelected,
                              menuMaxHeight: 300,
                              hint: const Text16Medium(text: 'Stamps Per Month'),
                              dropdownColor: AppColors.dialogBoxColor,
                              elevation: 5,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 25,
                              isExpanded: true,
                              onChanged: (newValue) {
                                statsDropdownProvider.setStampsSelected(newValue!);
                              },
                              items: days.map((value) {
                                return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontFamily: AppFonts.nunitoRegular,
                                          fontSize: 16.sp,
                                          color: AppColors.primaryText),
                                    ));
                              }).toList(),
                            );
                          },
                        )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomContainer2(
                  h: 285.h,
                  w: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
                    child: SfCartesianChart(
                        title: ChartTitle(
                            text: 'Stamp Per Month',
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primaryText,
                                fontFamily: AppFonts.nunitoRegular)),
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis:
                            NumericAxis(minimum: 0, maximum: 100, interval: 25),
                        tooltipBehavior:
                            _tooltip2 ?? TooltipBehavior(enable: true),
                        series: <ChartSeries<_ChartData, String>>[
                          ColumnSeries<_ChartData, String>(
                              dataSource: data2,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold',
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              color: AppColors.buttonColor)
                        ]),
                  )),
              SizedBox(height: 20.h),
              CustomButton(
                  title: 'Current Members',
                  onPress: () {
                    Get.to(() => const MembersView());
                  }
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
