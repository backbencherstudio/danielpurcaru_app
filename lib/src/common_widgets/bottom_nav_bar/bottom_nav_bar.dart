import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/icons.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          enableFeedback: false,
          backgroundColor: Colors.white,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => navigationShell.goBranch(index),

          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColorScheme.primary,
          ),
          unselectedLabelStyle: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColorScheme.labelTextColor,
          ),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.home,
                colorFilter: ColorFilter.mode(
                  navigationShell.currentIndex == 0
                      ? AppColorScheme.primary
                      : AppColorScheme.labelTextColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.submit,
                colorFilter: ColorFilter.mode(
                  navigationShell.currentIndex == 1
                      ? AppColorScheme.primary
                      : AppColorScheme.labelTextColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Submit',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.recording,
                colorFilter: ColorFilter.mode(
                  navigationShell.currentIndex == 2
                      ? AppColorScheme.primary
                      : AppColorScheme.labelTextColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Recording',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.loan,
                colorFilter: ColorFilter.mode(
                  navigationShell.currentIndex == 3
                      ? AppColorScheme.primary
                      : AppColorScheme.labelTextColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Loan',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.profile,
                colorFilter: ColorFilter.mode(
                  navigationShell.currentIndex == 4
                      ? AppColorScheme.primary
                      : AppColorScheme.labelTextColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: navigationShell,
    );
  }
}
