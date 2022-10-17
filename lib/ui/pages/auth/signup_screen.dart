import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/controllers/auth_provider.dart';
import 'package:note/ui/shared/widgets/header_text.dart';
import 'package:note/ui/shared/widgets/sub_title.dart';
import 'package:note/ui/shared/widgets/text_field.dart';
import 'package:note/utils/enums/gender_enum.dart';
import 'package:note/utils/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/styles_manager.dart';
import '../../../utils/resources/validation.dart';
import '../../../utils/routes/routes_const.dart';
import '../../shared/widgets/button.dart';
import '../../shared/widgets/disabled_button.dart';
import '../../shared/widgets/loading_indicator.dart';
import '../../shared/widgets/page_footer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Spaces.heightSpace(70),
                  HeaderText(text: 'sign'.tr(), gradientText: 'up'.tr()),
                  SubTitle(text: 'createNewAccount'.tr()),
                  Spaces.heightSpace(62.h),
                  MyTextField(
                    controller: provider.nameController,
                    hintText: 'fullName'.tr(),
                    prefixIcon: Image.asset(
                      'assets/icons/Profile.png',
                      fit: BoxFit.scaleDown,
                    ),
                    validator: (value) => Validations.nameValidator(value!),
                  ),
                  Spaces.heightSpace(AppSize.s14.h),
                  MyTextField(
                    controller: provider.emailController,
                    hintText: 'email'.tr(),
                    prefixIcon: Image.asset(
                      'assets/icons/email.png',
                      fit: BoxFit.scaleDown,
                    ),
                    validator: (value) => Validations.emailValidator(value!),
                  ),
                  Spaces.heightSpace(AppSize.s14.h),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          color: ColorManager.lightBlack,
                          borderRadius: BorderRadius.circular(AppSize.s6.r),
                          child: RadioListTile(
                            activeColor: ColorManager.teal,
                            value: Gender.Female,
                            groupValue: provider.gender,
                            onChanged: (value) =>
                                provider.changreGender(value!),
                            title: Text(
                              'female'.tr(),
                              style: getSemiBoldStyle(
                                fontSize: FontSize.s15.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spaces.widthSpace(AppSize.s15.w),
                      Expanded(
                        child: Material(
                          color: ColorManager.lightBlack,
                          borderRadius: BorderRadius.circular(AppSize.s6.r),
                          child: RadioListTile(
                            activeColor: ColorManager.teal,
                            value: Gender.Male,
                            groupValue: provider.gender,
                            onChanged: (value) =>
                                provider.changreGender(value!),
                            title: Text(
                              'male'.tr(),
                              style: getSemiBoldStyle(
                                fontSize: FontSize.s15.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spaces.heightSpace(AppSize.s14.h),
                  MyTextField(
                    controller: provider.passwordController,
                    ispassword: true,
                    hintText: 'password'.tr(),
                    prefixIcon: Image.asset(
                      'assets/icons/Lock.png',
                      fit: BoxFit.scaleDown,
                    ),
                    validator: (value) => Validations.passwordValidator(value!),
                  ),
                  Spaces.heightSpace(AppSize.s14.h),
                  MyTextField(
                    controller: provider.confirmPasswordController,
                    ispassword: true,
                    hintText: 'confirmPassword'.tr(),
                    prefixIcon: Image.asset(
                      'assets/icons/Lock.png',
                      fit: BoxFit.scaleDown,
                    ),
                    validator: (value) => Validations.confirmPassValidator(
                        value!, provider.passwordController.text),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        side: BorderSide(color: ColorManager.grey),
                        value: provider.isAgree,
                        onChanged: (value) => provider.agreeWithTrams(value!),
                      ),
                      SubTitle(
                        text: 'agreeWithTramsAndCondition'.tr(),
                        fontSize: FontSize.s16.sp,
                      ),
                    ],
                  ),
                  Spaces.heightSpace(20.h),
                  provider.isAgree
                      ? (provider.isloading
                          ? DisabledButton(child: LoadingIndiaor())
                          : Button(
                              onPressed: () {
                                provider.signUp(formKey);
                              },
                              widget: Text(
                                'signUp'.tr(),
                                style:
                                    getSemiBoldStyle(color: ColorManager.white),
                              ),
                            ))
                      : DisabledButton(
                          child: Text(
                            'signUp'.tr(),
                            style: getSemiBoldStyle(color: ColorManager.white),
                          ),
                        ),
                  Spaces.heightSpace(50.h),
                  PageFooter(
                      firsText: 'haveAnAccount'.tr(),
                      secondText: 'login'.tr(),
                      onPressed: () {
                        locator<NavigationService>()
                            .pushNamed(routeName: RouteConstants.login);
                        provider.clearControllers();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
