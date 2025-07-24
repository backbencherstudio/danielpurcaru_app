import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common_widgets/custom_popup_menu/custom_popup_menu.dart';
import '../../../data/riverpod/project_riverpod.dart';

class SelectProjectDropDownButton extends ConsumerWidget {
  const SelectProjectDropDownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final selectedProject = ref.watch(selectedProjectProvider);
    final projectState = ref.watch(projectProvider);
    final key = GlobalKey();

    return projectState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (projects) {
        return GestureDetector(
          key: key,
          onTap: () async {
            if (projects.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No projects available')),
              );
              return;
            }

            final result = await customPopupMenu(
              context: context,
              key: key,
              areas: projects.map((e) => e.name).toSet(), // show project names
            );

            if (result != null) {
              final selected = projects.where((element) => element.name == result).firstOrNull;


              ref.read(selectedProjectProvider.notifier).state = selected;
                        }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
            margin: AppPadding.horizontalPadding,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColorScheme.borderColor),
            ),
            child: Row(
              children: [
                Text(
                  selectedProject?.name ?? "Select the Project",
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          ),
        );
      },
    );
  }
}
