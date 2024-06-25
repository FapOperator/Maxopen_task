import 'package:shared_preferences/shared_preferences.dart';

abstract class _Keys {
  static const IfExistsInviteBool = 'if_exists_invite_bool';
}

class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  Future<void> setIfExistsInviteBool(bool value) {
    return _prefs.setBool(_Keys.IfExistsInviteBool, value);
  }

  Future<void> setIfExistsInviteString(String value) {
    return _prefs.setString(_Keys.IfExistsInviteBool, value);
  }

  bool? getIfExistsInviteBool() => _prefs.getBool(_Keys.IfExistsInviteBool);
  String? getIfExistsInviteString() =>
      _prefs.getString(_Keys.IfExistsInviteBool);

  Future<void> deleteIfExistsInviteBool() {
    return _prefs.remove(_Keys.IfExistsInviteBool);
  }
}
