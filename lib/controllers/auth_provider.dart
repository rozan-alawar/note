import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/api/api_services/auth_api.dart';
import 'package:note/services/locator.dart';
import 'package:note/services/snack_bar_service.dart';
import 'package:note/ui/shared/widgets/alert.dart';
import 'package:note/ui/shared/widgets/loading_indicator.dart';
import 'package:note/utils/enums/gender_enum.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'package:path_provider/path_provider.dart';

import '../api/api_constant/dio_exception.dart';
import '../services/navigation_service.dart';
import '../services/storage_services.dart';
import '../utils/resources/values_manager.dart';
import '../utils/routes/routes_const.dart';

class AuthProvider with ChangeNotifier {
  bool isAgree = false;
  Gender gender = Gender.Female;
  bool isloading = false;
  bool isLoginned = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void agreeWithTrams(bool value) {
    isAgree = value;
    notifyListeners();
  }

  void logined(bool value) {
    isLoginned = value;
    notifyListeners();
  }

  changreGender(Gender gender) {
    this.gender = gender;
    notifyListeners();
  }

  signUp(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        isloading = true;
        notifyListeners();
        final response = await locator<AuthApi>().signUp(
          email: emailController.text.trim(),
          fullName: nameController.text.trim(),
          password: passwordController.text.trim(),
          gender: gender == Gender.Female ? "F" : "M",
        );
        if (response.status == true) {
          isloading = false;
          locator<SnackBarSrevie>()
              .showSnackBar(response.message!, color: ColorManager.teal);
          locator<NavigationService>()
              .pushReplacementNamed(RouteConstants.login);
          clearControllers();
        }
      } on DioError catch (err) {
        isloading = false;
        notifyListeners();
        final errorMessage = DioException.fromDioError(err);
        locator<SnackBarSrevie>().showSnackBar(errorMessage.message);
      }
    }
  }

  login(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        isloading = true;
        notifyListeners();

        final response = await locator<AuthApi>().login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (response.status == true) {
          isloading = false;
          locator<SnackBarSrevie>()
              .showSnackBar(response.message!, color: ColorManager.teal);
          locator<NavigationService>()
              .pushReplacementNamed(RouteConstants.note);
          locator<Storage>().setToken(response.user!.token!);
          locator<Storage>().writeBool(isLoginned);
          clearControllers();
          notifyListeners();
        }
      } on DioError catch (err) {
        isloading = false;
        notifyListeners();
        final errorMessage = DioException.fromDioError(err);
        locator<SnackBarSrevie>().showSnackBar(errorMessage.message);
      }
    }
  }

  forgetPassword(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        isloading = true;
        notifyListeners();
        final response = await locator<AuthApi>().forgetPassword(
          email: emailController.text.trim(),
        );
        if (response.status == true) {
          isloading = false;
          locator<SnackBarSrevie>()
              .showSnackBar(response.message!, color: ColorManager.teal);

          await locator<Storage>().setCode(response.code.toString());
          clearControllers();

          locator<NavigationService>()
              .pushReplacementNamed(RouteConstants.resetPassword);
          notifyListeners();
        }
      } on DioError catch (err) {
        isloading = false;
        notifyListeners();
        final errorMessage = DioException.fromDioError(err);
        locator<SnackBarSrevie>().showSnackBar(errorMessage.message);
      }
    }
  }

  resertPassword(GlobalKey<FormState> formKey) async {
    print(passwordController.text.trim());
    print(confirmPasswordController.text.trim());
    if (formKey.currentState!.validate()) {
      try {
        final code = int.parse(await locator<Storage>().getCode());
        isloading = true;
        notifyListeners();
        final response = await locator<AuthApi>().resetPassword(
            email: emailController.text.trim(),
            code: code,
            password: passwordController.text.trim(),
            confirmPassword: confirmPasswordController.text.trim());
        if (response.status == true) {
          isloading = false;
          locator<SnackBarSrevie>()
              .showSnackBar(response.message!, color: ColorManager.teal);
          locator<NavigationService>()
              .pushReplacementNamed(RouteConstants.login);
          clearControllers();
          notifyListeners();
        }
      } on DioError catch (err) {
        isloading = false;
        notifyListeners();
        final errorMessage = DioException.fromDioError(err);
        locator<SnackBarSrevie>().showSnackBar(errorMessage.message);
      }
    }
  }

  logout() async {
    try {
      isloading = true;
      showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (context) => MyAlert(
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('loggingOut'.tr()),
                    Spaces.heightSpace(20.h),
                    LoadingIndiaor(),
                  ],
                ),
              ));
      final response = await locator<AuthApi>().logout();
      if (response.status == true) {
        isloading = false;

        locator<Storage>().writeBool(false);
        locator<SnackBarSrevie>()
            .showSnackBar(response.message!, color: ColorManager.teal);
        locator<NavigationService>().pushReplacementNamed(RouteConstants.login);
        locator<Storage>().removeToken();

        await _deleteCacheDir();
        notifyListeners();
      }
    } on DioError catch (err) {
      isloading = false;
      notifyListeners();
      locator<SnackBarSrevie>().showSnackBar(err.response!.data['message']);
    }
  }

  clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }
}
