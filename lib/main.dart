import 'package:beard_friends/Views/Account%20Setting%20View/Providers/language_dropdown_provider.dart';
import 'package:beard_friends/Views/Bottom%20Nav%20Bar/Providers/bottom_nav_bar_provider.dart';
import 'package:beard_friends/Views/Compaign%20View/Providers/switch_provider.dart';
import 'package:beard_friends/Views/Create%20Compaign%20View/Providers/create_compaign_dropdown_provider.dart';
import 'package:beard_friends/Views/Participate%20View/Providers/rules_check_box_provider.dart';
import 'package:beard_friends/Views/Product%20View/Providers/product_provider.dart';
import 'package:beard_friends/Views/Signup%20View/Providers/signup_policy_check_box_provider.dart';
import 'package:beard_friends/Views/Signup%20View/Providers/signup_terms_check_box_provider.dart';
import 'package:beard_friends/Views/Stats%20View/Providers/stats_dropdown_provider.dart';
import 'package:beard_friends/Views/Timing%20View/Providers/days_dropdown_provider.dart';
import 'package:beard_friends/Views/Timing%20View/Providers/hours_dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'App Constants/App Colors/app_colors.dart';
import 'Views/Participate View/Providers/terms_check_box_provider.dart';
import 'Views/Splash View/splash_view.dart';
import 'Views/Timing View/Providers/timing_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => TimingProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => HoursDropdownProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => DaysDropdownProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => LanguageDropdownProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => BottomNavigationBarProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => SwitchProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => CreateCompaignDropdownProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => RulesCheckBoxProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => TermsCheckBoxProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => SignupPolicyCheckBoxProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => SignupTermsCheckBoxProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => StatsDropDownProvider(),
            ),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldColor,
              appBarTheme:
                  AppBarTheme(backgroundColor: AppColors.scaffoldColor),
              useMaterial3: true,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const SplashView(),
    );
  }
}
