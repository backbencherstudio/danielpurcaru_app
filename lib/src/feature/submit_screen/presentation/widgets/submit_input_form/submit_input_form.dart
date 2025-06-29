import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_input_field.dart';

class SubmitInputForm extends StatefulWidget {
  const SubmitInputForm({super.key});

  @override
  State<SubmitInputForm> createState() => _SubmitInputFormState();
}

class _SubmitInputFormState extends State<SubmitInputForm> {
  late final TextEditingController startTimeController;
  late final TextEditingController lunchStartTimeController;
  late final TextEditingController lunchEndTimeController;
  late final TextEditingController endTimeController;
  late final FocusNode focusNode;
  late final FocusNode lunchStartFocusNode;
  late final FocusNode lunchEndFocusNode;
  late final FocusNode endTimeFocusNode;

  @override
  void initState() {
    startTimeController = TextEditingController();
    lunchStartTimeController = TextEditingController();
    lunchEndTimeController = TextEditingController();
    endTimeController = TextEditingController();
    focusNode = FocusNode();
    lunchStartFocusNode = FocusNode();
    lunchEndFocusNode = FocusNode();
    endTimeFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    startTimeController.dispose();
    lunchStartTimeController.dispose();
    lunchEndTimeController.dispose();
    endTimeController.dispose();
    focusNode.dispose();
    lunchStartFocusNode.dispose();
    lunchEndFocusNode.dispose();
    endTimeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      margin: AppPadding.horizontalPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        spacing: 24.h,
        children: [
          Row(
            spacing: 12.w,
            children: [
              CustomInputField(
                focusNode: focusNode,
                textTheme: textTheme,
                title: "Start",
                controller: startTimeController,
              ),
              CustomInputField(
                flex: 2,
                textTheme: textTheme,
                title: "Lunch",
                controller: lunchStartTimeController,
                middleLastController: lunchEndTimeController,
                focusNode: lunchStartFocusNode,
                middleLastFocusNode: lunchEndFocusNode,
                isMiddle: true,
              ),
              CustomInputField(
                textTheme: textTheme,
                title: "End",
                controller: endTimeController,
                focusNode: endTimeFocusNode,
              ),
            ],
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
          ),
        ],
      ),
    );
  }
}
