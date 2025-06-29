import 'package:danielpurcaru_time_tracker_app/core/constant/icons.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:danielpurcaru_time_tracker_app/src/common_widgets/custom_app_bar/language_manu_bar/riverpod/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LanguageManuBar extends StatelessWidget {
  LanguageManuBar({super.key});

  final GlobalKey _menuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer(
      builder: (_, ref, _) {
        final language = ref.watch(languageProvider);
        final languageNotifier = ref.read(languageProvider.notifier);
        return GestureDetector(
          key: _menuKey,
          onTap: () async {
            final RenderBox renderBox =
                _menuKey.currentContext!.findRenderObject() as RenderBox;
            final Offset offset = renderBox.localToGlobal(
              Offset.zero,
            ); // top-left position
            final Size size = renderBox.size;
            final result = await showMenu<String>(
              context: context,
              color: Colors.white,
              elevation: 10,
              shadowColor: Color.fromRGBO(0, 0, 0, 0.10),
              constraints: BoxConstraints(
                minWidth: 150.w,
                maxWidth: 160.w,
                minHeight: 126.h,
                //  maxHeight: 126.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              position: RelativeRect.fromLTRB(
                offset.dx,
                offset.dy + size.height,
                20.w,
                offset.dy,
              ),
              items: [
                PopupMenuItem<String>(
                  value: "Portugal",
                  child: Text(
                    "Portugal",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const PopupMenuDivider(color: AppColorScheme.labelTextColor),
                PopupMenuItem<String>(
                  value: "English",
                  child: Text(
                    "English",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const PopupMenuDivider(color: AppColorScheme.labelTextColor),
                PopupMenuItem<String>(
                  value: "Spanish",
                  child: Text(
                    "Spanish",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
            debugPrint("\nlanguage : $result\n");
            languageNotifier.updateLanguage(language: result ?? language);
          },
          child: Container(
            width: 105.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            margin: EdgeInsets.only(right: 24.w),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // spacing: 7.w,
              children: [
                SvgPicture.asset(AppIcons.globe),
                Text(language),
                Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          ),
        );
      },
    );
  }
}
