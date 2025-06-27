import 'package:flutter/material.dart';

import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [CustomAppBar(title: "Company Name",)],
      ),
    );
  }
}