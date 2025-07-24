import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/theme_extension/color_scheme.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextEditingController? middleLastController;
  final FocusNode? middleLastFocusNode;
  final String title;
  final TextTheme textTheme;
  final bool isMiddle;
  final int flex;
  final bool enable;
  final VoidCallback? onTap;

  const CustomInputField({
    super.key,
    required this.controller,
    this.middleLastController,
    required this.focusNode,
    this.middleLastFocusNode,
    required this.title,
    required this.textTheme,
    this.isMiddle = false,
    this.flex = 1,
    this.enable = true,
    this.onTap,
  });

  void onChanged({
    required String value,
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    if (value.length > 5) {
      controller.text = value.substring(0, value.length - 1);
      focusNode.nextFocus();
    } else if (value.isNotEmpty) {
      debugPrint("\n value : $value\n");

      if (value.substring(value.length - 1) == ':') {
        controller.text = value.substring(0, value.length - 1);
      }
      if (controller.text.length == 2 &&
          value.substring(value.length - 1) != ':') {
        controller.text = "$value:";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final midLastController = middleLastController ?? controller;
    final midFocusNode = middleLastFocusNode ?? focusNode;
    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          Text(
            title,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColorScheme.secondaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 38.h,
            child: isMiddle
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: AppColorScheme.surface,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColorScheme.borderColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: onTap,
                            child: TextFormField(
                              controller: controller,
                              focusNode: focusNode,
                              enabled: enable,
                              onTapOutside: (_) => focusNode.unfocus(),
                              onChanged: (value) => onChanged(
                                value: value,
                                controller: controller,
                                focusNode: focusNode,
                              ),

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 9.h,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "12.00",
                              ),
                            ),
                          ),
                        ),

                        VerticalDivider(
                          width: 38.h,
                          color: AppColorScheme.borderColor,
                        ),

                        Expanded(
                          child: GestureDetector(
                            onTap: onTap,
                            child: TextFormField(
                              focusNode: midFocusNode,
                              onTapOutside: (_) => midFocusNode.unfocus(),
                              controller: midLastController,
                              enabled: enable,
                              onChanged: (value) => onChanged(
                                value: value,
                                controller: midLastController,
                                focusNode: midFocusNode,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 9.h,
                                  horizontal: 2.w,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "13.00",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: onTap,
                    child: TextFormField(
                      focusNode: focusNode,
                      onTapOutside: (_) => focusNode.unfocus(),
                      controller: controller,
                      enabled: enable,
                      onChanged: (value) => onChanged(
                        value: value,
                        controller: controller,
                        focusNode: focusNode,
                      ),
                      decoration: InputDecoration(
                        hintText: "$title time",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 9.h,
                          horizontal: 8.w,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
