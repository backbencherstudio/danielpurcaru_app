import 'package:danielpurcaru_time_tracker_app/src/feature/submit_screen/presentation/widgets/select_area_drop_down_button/select_area_drop_down_button.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/submit_screen/presentation/widgets/select_project_drop_down_button/select_project_drop_downl_button.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/submit_screen/presentation/widgets/submit_input_form/submit_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';
import '../../calendar/calendar.dart';
import '../../home_screen/presentation/widgets/user_work_summary.dart';
import '../data/riverpod/project_riverpod.dart';

class SubmitScreen extends ConsumerStatefulWidget {
  const SubmitScreen({super.key});

  @override
  ConsumerState<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends ConsumerState<SubmitScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    Future.microtask(() {
      ref.read(projectProvider.notifier).fetchProjects(
        userId: "cmcsy3x090000wsd4r4ap187i",
        startDate: "2023-12-20",
        endDate: "2023-12-20",
      );
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: "Company Name"),

            SizedBox(height: 24.h),

            const Calendar(),

            SizedBox(height: 16.h),

            SelectAreaDropDownButton(),

            SizedBox(height: 16.h),

            const SelectProjectDropDownButton(),

            SizedBox(height: 16.h),

            const SubmitInputForm(),

            SizedBox(height: 16.h),

            const UserWorkSummary(isHeading: false, rateShow: false),

            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
