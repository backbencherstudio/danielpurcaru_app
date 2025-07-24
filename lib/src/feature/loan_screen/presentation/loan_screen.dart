import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/loan/loan_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  late final TextEditingController loanController;
  late final FocusNode focusNode;

  @override
  void initState() {
    loanController = TextEditingController(text: "\$100");
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    loanController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: "Company Name"),
            SizedBox(height: 24.h),
            Container(
              width: double.infinity,
              margin: AppPadding.horizontalPadding,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  Text(
                    "Prices",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: loanController,
                    focusNode: focusNode,
                    onTapOutside: (_) {
                      focusNode.unfocus();
                    },
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        LoanRepositoryImpl loanRepository = LoanRepositoryImpl();
                        loanRepository.postLoan(amount: 100);
                      },
                      child: Text("Apply"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
