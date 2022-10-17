import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/ui/shared/widgets/disabled_button.dart';
import 'package:note/ui/shared/widgets/loading_indicator.dart';
import 'package:note/utils/resources/validation.dart';
import 'package:note/utils/resources/values_manager.dart';

import 'package:provider/provider.dart';

import '../../../controllers/auth_provider.dart';
import '../../shared/widgets/button.dart';
import '../../shared/widgets/header_text.dart';
import '../../shared/widgets/sub_title.dart';
import '../../shared/widgets/text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) => Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spaces.heightSpace(100.h),
                    HeaderText(
                        text: '${'reset'.tr()} ',
                        gradientText: 'password'.tr()),
                    Spaces.heightSpace(AppSize.s16.h),
                    SubTitle(text: 'resetPasswordDetails'.tr()),
                    Spaces.heightSpace(AppSize.s24.h),
                    MyTextField(
                      controller: provider.emailController,
                      hintText: 'email'.tr(),
                      prefixIcon: null,
                      validator: (value) => Validations.emailValidator(value!),
                    ),
                    Spaces.heightSpace(AppSize.s24.h),
                    provider.isloading
                        ? DisabledButton(child: LoadingIndiaor())
                        : Button(
                            onPressed: () => provider.forgetPassword(formKey),
                            widget: Text('next'.tr())),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
