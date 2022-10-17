import 'package:easy_localization/easy_localization.dart';
import 'package:note/utils/extensions/validation_extension.dart';

class Validations {
  static passwordValidator(String value) {
    if (value.isEmpty) {
      return 'passwordValidation'.tr();
    }

    if (value.length < 3) {
      return 'passwordValid'.tr();
    } else {
      return null;
    }
  }

  static confirmPassValidator(String value, String password) {
    if (value.isEmpty) {
      return 'passwordValidation'.tr();
    }

    if (value.compareTo(password) != 0) {
      return 'confirmPassValidation'.tr();
    } else {
      return null;
    }
  }

  static emailValidator(String value) {
    if (value.isEmpty || !value.isValidEmail) {
      return 'emailValidation'.tr();
    } else {
      return null;
    }
  }

  static nameValidator(String value) {
    if (value.isEmpty) {
      return 'nameValidation'.tr();
    } else {
      return null;
    }
  }
}
