import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/utils/utils.dart';
import 'package:danielpurcaru_time_tracker_app/l10n/app_localizations.dart';
import 'package:danielpurcaru_time_tracker_app/l10n/app_localizations_en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../../data/repository/attendance/attendance_repository_impl.dart';
import '../../../data/riverpod/address_selection_provider.dart';
import '../../../data/riverpod/project_riverpod.dart';
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
    final language = AppLocalizations.of(context);
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
                title: language!.start,
                controller: startTimeController,
                enable: false,
                onTap: () async {
                  startTimeController.text =
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          return value.format(context);
                        } else {
                          return "";
                        }
                      });
                },
              ),
              CustomInputField(
                flex: 2,
                textTheme: textTheme,
                title: language.end,
                controller: lunchStartTimeController,
                middleLastController: lunchEndTimeController,
                focusNode: lunchStartFocusNode,
                middleLastFocusNode: lunchEndFocusNode,
                isMiddle: true,
                enable: false,
                onTap: () async {
                  lunchStartTimeController.text =
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          return value.format(context);
                        } else {
                          return "";
                        }
                      });
                  lunchEndTimeController.text =
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          return value.format(context);
                        } else {
                          return "";
                        }
                      });
                },
              ),
              CustomInputField(
                textTheme: textTheme,
                title: language.end,
                controller: endTimeController,
                focusNode: endTimeFocusNode,
                enable: false,
                onTap: () async {
                  endTimeController.text =
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          return value.format(context);
                        } else {
                          return "";
                        }
                      });
                },
              ),
            ],
          ),

          Consumer(
            builder: (context, ref, _) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    AttendanceRepositoryImpl attendanceRepository =
                        AttendanceRepositoryImpl();

                    final projectId = ref
                        .watch(selectedProjectProvider)!
                        .id
                        .toString();
                    final date = DateFormat(
                      'yyyy-MM-dd',
                    ).format(DateTime.now()).toString();
                    final address = ref.watch(addressSelectionProvider);

                    final startTimeRaw = startTimeController.text;
                    final lunchStartRaw = lunchStartTimeController.text;
                    final lunchEndRaw = lunchEndTimeController.text;
                    final endTimeRaw = endTimeController.text;

                    final startTime = Utils.combineDateAndTime(
                      date,
                      startTimeRaw,
                    );
                    final lunchStart = Utils.combineDateAndTime(
                      date,
                      lunchStartRaw,
                    );
                    final lunchEnd = Utils.combineDateAndTime(
                      date,
                      lunchEndRaw,
                    );
                    final endTime = Utils.combineDateAndTime(date, endTimeRaw);

                    debugPrint(projectId);
                    debugPrint(startTime);
                    debugPrint(lunchStart);
                    debugPrint(lunchEnd);
                    debugPrint(endTime);

                    attendanceRepository.submitAttendance(
                      projectId: projectId,
                      startTime: startTime,
                      lunchStartTime: lunchStart,
                      lunchEndTime: lunchEnd,
                      endTime: endTime,
                      date: date,
                      address: address,
                    );
                  },

                  child: Text("Submit"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
