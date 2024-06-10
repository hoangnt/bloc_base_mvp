import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtil {
  static final LocalStorageUtil instance = LocalStorageUtil._();
  LocalStorageUtil._();

  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _email = "email";
  final String _password = "password";

  Future<bool> saveEmail(String email) async =>
      await _prefs.setString(_email, email);
  String? getEmail() => _prefs.getString(_email);

  Future<bool> savePassword(String password) async =>
      await _prefs.setString(_password, password);
  String? getPassword() => _prefs.getString(_password);
}
