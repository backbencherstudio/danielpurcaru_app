import 'dart:ui';

import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/routes/route_const.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services_impl.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/login_screen/riverpod/single_value_provider/password_visibility_provider.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/login_screen/riverpod/single_value_provider/remember_me_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/chache/shared_preferences_services.dart';
import '../data/riverpod/auth_riverpod.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final FocusNode userNameFocusNode;
  late final FocusNode passwordFocusNode;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    userNameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }



  @override
  void dispose() {
    userNameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.horizontalPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70.h),
                Text("Hi! Welcome Back", style: textTheme.displaySmall),
                SizedBox(height: 2.h),
                Text(
                  "Log in to your account",
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColorScheme.labelTextColor,
                  ),
                ),
                SizedBox(height: 42.h),
                TextFormField(
                  focusNode: userNameFocusNode,
                  controller: userNameController,
                  onTapOutside: (_) => userNameFocusNode.unfocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username or email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your Username or email",
                  ),
                ),
                SizedBox(height: 12.h),
                Consumer(
                  builder: (_, ref, _) {
                    final isObscure = ref.watch(passwordVisibilityProvider);
                    return TextFormField(
                      focusNode: passwordFocusNode,
                      onTapOutside: (_) => passwordFocusNode.unfocus(),
                      obscureText: isObscure,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        suffixIcon: GestureDetector(
                          onTap: () => ref
                              .read(passwordVisibilityProvider.notifier)
                              .toggleVisibility(),
                          child: Icon(
                            isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5.w,
                  children: [
                    Consumer(
                      builder: (_, ref, _) {
                        final isRemember = ref.watch(rememberMeProvider);
                        return Checkbox(
                          value: isRemember,
                          onChanged: (value) {
                            ref
                                .read(rememberMeProvider.notifier)
                                .toggleRememberMe();
                          },
                        );
                      },
                    ),
                    Text("Remember me"),
                  ],
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  child: Consumer(
                    builder: (context, ref, _) {
                      final authState = ref.watch(authControllerProvider);
                      return ElevatedButton(
                        onPressed: authState.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  final route = await ref
                                      .read(authControllerProvider.notifier)
                                      .login(
                                        email: userNameController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      );

                                  if (route != null && context.mounted) {
                                    context.go(route);
                                  }
                                }
                              },
                        child: authState.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Login'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
