

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthome/core/shared_pref/constants/preferences.dart';


class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Token Device
  String get getTokenDevice {
    return _sharedPreference.getString(Preferences.tokenDevice) ?? '';
  }

  Future<void> removeLogged() async {
    _sharedPreference.remove(Preferences.isLogged);
  }

  void setTokenDevice(String tokenDevice) {
    _sharedPreference.setString(Preferences.tokenDevice, tokenDevice);
  }

  // splash: ----------------------------------------------------------
  bool get getSplash {
    return _sharedPreference.getBool(Preferences.isSplash) ?? false;
  }

  void setSplash({required bool status}) {
    _sharedPreference.setBool(Preferences.isSplash, status);
  }

  // General Methods: Access token
  String get getJwtToken {
    return _sharedPreference.getString(Preferences.jwtToken) ?? '';
  }

  void setJwtToken(String authToken) {
    _sharedPreference.setString(Preferences.jwtToken, authToken);
  }

  // General Methods: Access token
  String get refreshToken {
    return _sharedPreference.getString(Preferences.refreshToken) ?? '';
  }

  void setRefreshToken(String refreshToken) {
    _sharedPreference.setString(Preferences.refreshToken, refreshToken);
  }

  // fcm token
  String get getFcmToken {
    return _sharedPreference.getString(Preferences.fcmToken) ?? '';
  }

  void setFcmToken(String fcmToken) {
    _sharedPreference.setString(Preferences.fcmToken, fcmToken);
  }

  //locale
  void setLocale(String locale) {
    _sharedPreference.setString(Preferences.locale, locale);
  }

  // locale
  String get getLocale {
    return _sharedPreference.getString(Preferences.locale) ?? 'en';
  }

  ///
  /// Time zone.
  ///
  String get getTimeZoneName {
    return _sharedPreference.getString(Preferences.idTimeZoneName) ?? '';
  }

  void setTimeZoneName({required String idTimeZoneName}) {
    _sharedPreference.setString(Preferences.idTimeZoneName, idTimeZoneName);
  }

  Future<bool> removeRefreshToken() {
    return _sharedPreference.remove(Preferences.refreshToken);
  }

  Future<bool> removeJwtToken() {
    return _sharedPreference.remove(Preferences.jwtToken);
  }

  // Loggin: ----------------------------------------------------------
  bool get getLogger {
    return _sharedPreference.getBool(Preferences.idLogger) ?? false;
  }

  Future<void> setLogger({required bool idLogger}) async{
    await _sharedPreference.setBool(Preferences.idLogger, idLogger);
  }

  Future<void> removeLogger() async {
    _sharedPreference.remove(Preferences.idLogger);
  }

  ///
  /// Set id user.
  ///
  String get getIdUser {
    return _sharedPreference.getString(Preferences.idUser) ?? '';
  }

  Future<void> setIdUser({required String idUser})async {
    await _sharedPreference.setString(Preferences.idUser, idUser);
  }

  void removeIdUser() {
    _sharedPreference.remove(Preferences.idUser);
  }

  ///
  /// Set id branch.
  ///
  String get getIdBranch {
    return _sharedPreference.getString(Preferences.branch) ?? '';
  }

  void setIdBranch({required String branch}) {
    _sharedPreference.setString(Preferences.branch, branch);
  }

  void removeIdBranch() {
    _sharedPreference.remove(Preferences.branch);
  }

  ///
  /// Name branch.
  ///


  void setIsRatedApp({required bool isRate}) {
    _sharedPreference.setBool(Preferences.isRatedApp, isRate);
  }

  // check user Login app
  bool get getLoginApp {
    return _sharedPreference.getBool(Preferences.isLoginApp) ?? false;
  }

  void setLoginApp({required bool isLogin}) {
    _sharedPreference.setBool(Preferences.isLoginApp, isLogin);
  }

  ///set user
  bool get getRememberAccount {
    return _sharedPreference.getBool(Preferences.rememberAccount) ?? false;
  }

  void setRememberAccount({required bool rememberAccount}) {
    _sharedPreference.setBool(Preferences.rememberAccount, rememberAccount);
  }

  void removeRememberAccount() {
    _sharedPreference.remove(Preferences.rememberAccount);
  }

  bool get getIsLoginEmail {
    return _sharedPreference.getBool(Preferences.isLoginEmail) ?? false;
  }

  void setIsLoginEmail({required bool isLoginEmail}) {
    _sharedPreference.setBool(Preferences.isLoginEmail, isLoginEmail);
  }

  String? get getEmail {
    return _sharedPreference.getString(Preferences.email);
  }

  Future<void> setEmail(String value) async {
    await _sharedPreference.setString(Preferences.email, value);
  }

  Future<void> removeEmail() async {
    await _sharedPreference.remove(Preferences.email);
  }

  String? get getPassword {
    return _sharedPreference.getString(Preferences.password);
  }

  Future<void> setPassword(String value) async {
    await _sharedPreference.setString(Preferences.password, value);
  }

  Future<void> removePassword() async {
    await _sharedPreference.remove(Preferences.password);
  }}
