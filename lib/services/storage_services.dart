import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:note/utils/resources/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? instance;
  final _storage = const FlutterSecureStorage();
  Storage() {
    initSP();
  }

  static initSP() async {
    instance = await SharedPreferences.getInstance();
  }

  setToken(String token) async {
    _storage.write(key: Keys.Token, value: 'Bearer $token');
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: Keys.Token);
    return token;
  }

  removeToken() {
    _storage.delete(key: Keys.Token);
  }

  //reset password code ...

  setCode(String code) async {
    _storage.write(key: Keys.ResetCode, value: code);
  }

  Future<String> getCode() async {
    String? code = await _storage.read(key: Keys.ResetCode);
    return code!;
  }

  removeCode() async {
    await _storage.delete(key: Keys.ResetCode);
  }

  writeBool(bool value) async {
    await instance!.setBool(Keys.IsLogin, value);
  }

  bool readBool() {
    return instance!.getBool(Keys.IsLogin) ?? false;
  }

  writeString(String key, String value) async {
    await instance!.setString(key, value);
  }

  String? readString(String key) {
    return instance!.getString(key);
  }
}
