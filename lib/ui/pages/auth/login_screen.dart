import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/controllers/auth_provider.dart';
import 'package:note/ui/shared/widgets/sub_title.dart';
import 'package:note/utils/resources/font_manager.dart';
import 'package:provider/provider.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/styles_manager.dart';
import '../../../utils/resources/validation.dart';
import '../../../utils/resources/values_manager.dart';
import '../../../utils/routes/routes_const.dart';
import '../../shared/widgets/button.dart';
import '../../shared/widgets/disabled_button.dart';
import '../../shared/widgets/header_text.dart';
import '../../shared/widgets/loading_indicator.dart';
import '../../shared/widgets/page_footer.dart';
import '../../shared/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p25.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Spaces.heightSpace(100.h),
                    HeaderText(
                        text: '${'welcom'.tr()} ', gradientText: 'back'.tr()),
                    Spaces.heightSpace(AppSize.s20.h),
                    Image.asset(
                      'assets/images/splash_screen.png',
                      width: 172.w,
                      height: 172.h,
                    ),
                    Spaces.heightSpace(AppSize.s20.h),
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
                    MyTextField(
                      controller: provider.passwordController,
                      ispassword: true,
                      hintText: 'password'.tr(),
                      prefixIcon: Image.asset(
                        'assets/icons/Lock.png',
                        fit: BoxFit.scaleDown,
                      ),
                      validator: (value) =>
                          Validations.passwordValidator(value!),
                    ),
                    Spaces.heightSpace(AppSize.s14.h),
                    Row(
                      children: [
                        Checkbox(
                          value: provider.isLoginned,
                          onChanged: (value) => provider.logined(value!),
                        ),
                        Text('rememberMe'.tr()),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              provider.clearControllers();
                              locator<NavigationService>().pushNamed(
                                routeName: RouteConstants.forgetPassword,
                              );
                            },
                            child: SubTitle(
                                text: 'forgetPassword'.tr(),
                                fontSize: FontSize.s16.sp)),
                      ],
                    ),
                    Spaces.heightSpace(30.h),
                    provider.isloading
                        ? DisabledButton(child: LoadingIndiaor())
                        : Button(
                            onPressed: () {
                              provider.login(formKey);
                            },
                            widget: Text(
                              'login'.tr(),
                              style:
                                  getSemiBoldStyle(color: ColorManager.white),
                            ),
                          ),
                    Spaces.heightSpace(150.h),
                    PageFooter(
                        firsText: 'haventAnAccount'.tr(),
                        secondText: 'signUp'.tr(),
                        onPressed: () {
                          locator<NavigationService>()
                              .pushNamed(routeName: RouteConstants.signup);
                          provider.clearControllers();
                        }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
