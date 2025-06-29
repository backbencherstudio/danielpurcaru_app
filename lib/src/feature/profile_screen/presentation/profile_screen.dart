import 'package:danielpurcaru_time_tracker_app/core/constant/icons.dart';
import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/routes/route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget customListTile({
    required String title,
    required String iconPath,
    required Function onTap,
    Color? color,
    required TextTheme textTheme,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          spacing: 12.w,
          children: [
            SvgPicture.asset(iconPath),
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Profile", centerTitle: true, isTrailing: false),
          SizedBox(height: 24.h),
          Padding(
            padding: AppPadding.horizontalPadding,
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  customListTile(
                    title: "Jerome Bell",
                    iconPath: AppIcons.user,
                    onTap: () {},
                    textTheme: textTheme,
                  ),
                  customListTile(
                    title: "jeromebell@gmail.com",
                    iconPath: AppIcons.email,
                    onTap: () {},
                    textTheme: textTheme,
                  ),
                  customListTile(
                    title: "Logout",
                    iconPath: AppIcons.logOut,
                    onTap: ()=> context.go(RouteName.loginScreen),
                    textTheme: textTheme,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
