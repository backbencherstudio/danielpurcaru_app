import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widgets/custom_popup_menu/custom_popup_menu.dart';

class SelectAreaDropDownButton extends StatelessWidget {
  SelectAreaDropDownButton({super.key});

  final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      key: _key,
      onTap: () async {
        final result = await customPopupMenu(
          context: context,
          key: _key,
          areas: {"Portugal", "USA", "Bangladesh", "UK"},
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        margin: AppPadding.horizontalPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColorScheme.borderColor,
            // width: 2
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined, color: AppColorScheme.onSurface),
            Text(
              "Select the area",
              style: textTheme.bodyMedium?.copyWith(
                color: AppColorScheme.onSurface,
              ),
            ),
            Spacer(),

            Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
      ),
    );
  }
}
