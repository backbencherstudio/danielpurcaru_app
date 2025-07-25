import 'package:danielpurcaru_time_tracker_app/core/constant/icons.dart';
import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/routes/route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/chache/shared_preferences_services.dart';
import '../../../../core/services/chache/shared_preferences_services_impl.dart';
import '../../../../data/provider/user_provider.dart';
import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ref.read(userProvider.notifier).fetchUser();
    });
  }
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
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(width: 12.w),
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
    final user = ref.watch(userProvider);
    debugPrint(user.name.toString());
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
                children: [
                  customListTile(
                    title: user.name,
                    iconPath: AppIcons.user,
                    onTap: () {},
                    textTheme: textTheme,
                  ),
                  customListTile(
                    title: user.email ?? '',
                    iconPath: AppIcons.email,
                    onTap: () {},
                    textTheme: textTheme,
                  ),
                  customListTile(
                    title: "Logout",
                    iconPath: AppIcons.logOut,
                    onTap: () async {
                      final prefs = await SharedPreferencesServiceImpl.create();
                      prefs.remove([CacheKey.authToken]);
                      context.go(RouteName.loginScreen);
                    },
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
