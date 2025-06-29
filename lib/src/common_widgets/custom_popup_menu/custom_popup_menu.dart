import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String?> customPopupMenu({
  required BuildContext context,
  required GlobalKey key,
  required Set<String> areas,
}) async {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero);

  /// top-left position
  final Size size = renderBox.size;

  final result = await showMenu<String>(
    context: context,
    color: Colors.white,
    elevation: 20,
    shadowColor: AppColorScheme.shadowColor,
    constraints: BoxConstraints(
      minWidth: 160.w,
      minHeight: 160.h,
      maxHeight: 192.h,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    position: RelativeRect.fromLTRB(
      190.w,
      offset.dy + size.height,
      20.w,
      offset.dy,
    ),
    items: () {
      List<PopupMenuEntry<String>> menuItems = [];
      final areasList = areas.toList();

      /// Convert Set to List
      for (int i = 0; i < areasList.length; i++) {
        menuItems.add(
          PopupMenuItem(
            value: areasList[i],
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              areasList[i],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );

        /// Add a divider after each item except the last one
        if (i < areasList.length - 1) {
          menuItems.add(
            const PopupMenuDivider(color: AppColorScheme.borderColor),
          );
        }
      }
      return menuItems;
    }(),
  );

  return result;
}
