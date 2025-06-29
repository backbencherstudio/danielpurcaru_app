import 'package:danielpurcaru_time_tracker_app/src/feature/submit_screen/presentation/widgets/select_area_drop_down_button/select_area_drop_down_button.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/submit_screen/presentation/widgets/select_project_drop_down_button/select_project_drop_downl_button.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/submit_screen/presentation/widgets/submit_input_form/submit_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_list_calendar/horizontal_list_calendar.dart';

import '../../../../core/constant/padding.dart';
import '../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';
import '../../calendar/calendar.dart';
import '../../home_screen/presentation/widgets/user_work_summary.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Company Name"),

            SizedBox(height: 24.h),

            Calendar(),

            SizedBox(height: 16.h),

            SelectAreaDropDownButton(),

            SizedBox(height: 16.h),

            SelectProjectDropDownButton(),

            SizedBox(height: 16.h),

            SubmitInputForm(),

            SizedBox(height: 16.h),

            UserWorkSummary(isHeading: false,rateShow: false,),

            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
