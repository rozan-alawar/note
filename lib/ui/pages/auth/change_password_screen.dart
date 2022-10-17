import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/ui/shared/widgets/button.dart';
import 'package:note/ui/shared/widgets/disabled_button.dart';
import 'package:note/ui/shared/widgets/header_text.dart';
import 'package:note/ui/shared/widgets/loading_indicator.dart';
import 'package:note/ui/shared/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_provider.dart';
import '../../../utils/resources/validation.dart';
import '../../../utils/resources/values_manager.dart';

import '../../shared/widgets/sub_title.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) => Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                      child: HeaderText(
                          text: 'createNew'.tr(),
                          gradientText: 'password'.tr())),
                  Spaces.heightSpace(AppSize.s16.h),
                  SubTitle(text: 'changePassDescription'.tr()),
                  Spaces.heightSpace(AppSize.s40.h),
                  MyTextField(
                    controller: provider.emailController,
                    hintText: 'email'.tr(),
                    prefixIcon: Image.asset(
                      'assets/icons/email.png',
                      fit: BoxFit.scaleDown,
                    ),
                    validator: (value) => Validations.emailValidator(value!),
                  ),
                  Spaces.heightSpace(AppSize.s24.h),
                  MyTextField(
                    controller: provider.passwordController,
                    ispassword: true,
                    hintText: 'password'.tr(),
                    prefixIcon: Image.asset('assets/icons/Lock.png'),
                    validator: (value) =>
                        Validations.passwordValidator(value!.trim()),
                  ),
                  Spaces.heightSpace(AppSize.s24.h),
                  MyTextField(
                    controller: provider.confirmPasswordController,
                    ispassword: true,
                    hintText: 'confirmPassword'.tr(),
                    prefixIcon: Image.asset('assets/icons/Lock.png'),
                    validator: (value) => Validations.confirmPassValidator(
                        value!, provider.passwordController.text),
                  ),
                  Spaces.heightSpace(AppSize.s24.h),
                  provider.isloading
                      ? DisabledButton(child: LoadingIndiaor())
                      : Button(
                          onPressed: () => provider.resertPassword(formKey),
                          widget: Text('confirm'.tr())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
